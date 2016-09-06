FROM ovnion/container-back-cake
RUN chown -R www-data:www-data /var/www
ADD . /var/www/html/
WORKDIR /var/www/html/
RUN composer install
