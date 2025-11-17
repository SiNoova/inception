FROM debian:bookworm

COPY ./tools/setupwordpress.sh /usr/bin

RUN apt update && apt upgrade -y && apt install curl php php-mysqli php-fpm netcat-traditional -y 

RUN sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/8.2/fpm/pool.d/www.conf

WORKDIR /var/www/html

ENTRYPOINT ["bash", "setupwordpress.sh" ]