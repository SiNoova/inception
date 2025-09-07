FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install nginx curl openssl -y

COPY ./tools/setup_nginx.sh setup_nginx.sh

RUN chmod +x setup_nginx.sh && ./setup_nginx.sh

EXPOSE 443
