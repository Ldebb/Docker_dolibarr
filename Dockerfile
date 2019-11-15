FROM php:7.3-apache
MAINTAINER debbichi "lamjed.debbich@gmail.com"

# apt install
RUN apt-get update \
   && apt-get install -y wget unzip

# download dolibarr
RUN wget -O /usr/src/dolibarr.zip https://github.com/Dolibarr/dolibarr/archive/10.0.3.zip
WORKDIR /var/www

# run commands and permission
RUN unzip /usr/src/dolibarr.zip -d /usr/src/ \
       && rm /usr/src/dolibarr.zip \
       && rm -rf /var/html \
       && mv /usr/src/dolibarr*/* /var/www/html/ \
       && chown -R www-data:www-data /var/www/html/ \
       && chmod -R 755 /var/www/html/

RUN touch /var/www/html/htdocs/conf/conf.php \
       && chown www-data /var/www/html/htdocs/conf/conf.php

RUN sed -i 's|DocumentRoot.*|DocumentRoot /var/www/html/htdocs|' /etc/apache2/sites-enabled/000-default.conf
