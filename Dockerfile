FROM php:5.6-apache
RUN requirements="libmcrypt-dev g++ libicu-dev libmcrypt4 libicu52" \
    && apt-get update && apt-get install -y $requirements \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install intl \
    && requirementsToRemove="libmcrypt-dev g++ libicu-dev" \
    && apt-get purge --auto-remove -y $requirementsToRemove \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && apt-get update \
    && apt-get install -y zlib1g-dev git \
    && docker-php-ext-install zip \
    && apt-get purge -y --auto-remove zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*
    
RUN echo "ServerName localhost" >> /etc/apache2/httpd.conf
RUN sed -i '/^Include \/etc\/apache2\/sysconfig.d\/include.conf/s/^/#/' /etc/apache2/httpd.conf

RUN a2enmod rewrite
RUN usermod -u 1000 www-data
RUN chown -R www-data:www-data /var/www

ADD . /var/www/html/
WORKDIR /var/www/html/
RUN composer update