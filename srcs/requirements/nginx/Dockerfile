FROM debian:bookworm

RUN	apt update && apt upgrade -y && apt install nginx openssl -y

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -newkey rsa:2048 \	
	-keyout /etc/nginx/ssl/akoutatekey.key \	
	-out /etc/nginx/ssl/akoutatecert.crt \	
	-days 7 \	
	-subj "/C=MA/ST=BK/L=Khouribga/O=1337/CN=akoutate.42.fr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]