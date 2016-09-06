FROM ovnion/container-back-cake
ADD . /var/www/html/
WORKDIR /var/www/html/
RUN chown -R www-data:www-data /var/www
RUN composer update
