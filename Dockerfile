FROM ovnion/container-back-cake
WORKDIR /var/www/html/
RUN chown -R www-data:www-data /var/www
ADD * /var/www/html/
RUN composer install
