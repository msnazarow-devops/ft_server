# ft_server
wordpress + nginx + mariadb

If ssl keys are expired, you have to generate your own. To do this run:
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School 21/CN=sgertrud"
