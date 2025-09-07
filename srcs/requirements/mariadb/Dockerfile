FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install mariadb-server -y

COPY ./tools .

ENTRYPOINT ["echo", ""]
