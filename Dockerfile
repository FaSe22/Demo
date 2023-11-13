FROM php:8.1
COPY . /var/www/html
RUN chmod 777 -R /var/www/html/storage
RUN chmod 777 -R /var/www/html/bootstrap/cache
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring
WORKDIR /app
COPY . /app
RUN composer install

CMD php artisan serve --host=0.0.0.0 --port=8181
EXPOSE 8181
