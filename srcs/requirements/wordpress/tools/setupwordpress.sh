#!/bin/bash

if [ ! -e "wp-config.php" ]; then

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /bin/wp

	wp core download --allow-root
	wp config create --dbname=$WP_DB --dbuser=$WPUSER_DB --dbpass=$WPUSERPASSWORD_DB --dbhost=mariadb --allow-root
	wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --role=$WP_USER_ROLE --user_pass=$WP_USER_PASS --allow-root

	chown -R www-data:www-data .
	chmod 775 -R .

fi

exec php-fpm8.2 -F
