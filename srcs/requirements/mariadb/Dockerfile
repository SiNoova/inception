FROM debian:bookworm

COPY ./tools/populateDb.sh /bin

RUN chmod +x /bin/populateDb.sh && apt update && apt upgrade -y && apt install mariadb-server netcat-traditional -y

ENTRYPOINT ["populateDb.sh"]
