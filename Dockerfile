# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sgertrud <msnazarow@gmail.com>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/24 03:36:49 by sgertrud          #+#    #+#              #
#    Updated: 2021/01/08 06:51:59 by sgertrud         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
EXPOSE 80 443
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y nginx curl supervisor wget mariadb-server mariadb-client php-fpm
RUN apt-get install -y php-common php-mbstring php-xmlrpc php-soap php-gd php-intl php-mysql php-cli php-ldap php-zip php-curl
WORKDIR /var/www/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && tar -xvzf phpMyAdmin-5.0.2-all-languages.tar.gz && mv phpMyAdmin-5.0.2-all-languages wordpress/phpMyAdmin
RUN apt-get -y install nano
RUN apt-get -y install certbot python-certbot-nginx
COPY srcs/ .
RUN chmod +x *.sh
RUN mv nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key && \
    mv nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt && \
    mv localhost.conf /etc/nginx/sites-available/default
RUN bash start.sh
CMD [ "bash", "run.sh" ]
