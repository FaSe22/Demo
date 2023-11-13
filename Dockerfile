FROM startupwerk/php-runtime:8.1-fpm
COPY . /var/www/html
RUN chmod 777 -R /var/www/html/storage
RUN chmod 777 -R /var/www/html/bootstrap/cache
