FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install curl php php-mysqli php-fpm netcat-traditional -y 

RUN sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/8.2/fpm/pool.d/www.conf

WORKDIR /var/www/html

COPY ./tools/setupwordpress.sh /setupwordpress.sh 

RUN chmod +x /setupwordpress.sh

ENTRYPOINT ["/setupwordpress.sh" ]