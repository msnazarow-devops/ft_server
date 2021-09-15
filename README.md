# ft_server
wordpress + nginx + mariadb + phpMyAdmin

If ssl keys are expired, you have to generate your own. To do this run:

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School 21/CN=sgertrud"

Before run ft_server make sure you don't have another running server on your machine:
try localhost in browser, service nginx stop, service apache stop or smth like that

Usage: 

➜  ~ git clone https://github.com/msnazarow/ft_server

➜  ~ cd ft_server 

➜  ~ docker build -t ft_server .

➜  ~ docker run --rm -d -p 80:80 -p 443:443 --name ft_server ft_server

And after that you can easily open it in your browser by typing localhost(or your IP) as url address 

To stop container:

➜  ~ docker stop ft_server
