#!/bin/bash

service mariadb start;

sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS $WP_DB;";
mariadb -e "CREATE USER '$WPUSER_DB'@'%' IDENTIFIED BY '$WPUSERPASSWORD_DB';"
mariadb -e "GRANT ALL PRIVILEGES ON $WP_DB.* TO '$WPUSER_DB'@'%' IDENTIFIED BY '$WPUSERPASSWORD_DB';"
mariadb -e "FLUSH PRIVILEGES;";

mariadb-admin shutdown;

exec mariadbd-safe --bind-address=0.0.0.0 --port=3306 --datadir=/var/lib/mysql
