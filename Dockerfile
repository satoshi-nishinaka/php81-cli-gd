FROM php:8.2-cli AS composer-env
WORKDIR /work
### GDインストール
RUN apt-get update &&\
  # JPEG 対応
  apt-get install -y libpng-dev libjpeg62-turbo-dev libzip-dev &&\
  docker-php-ext-configure gd --with-jpeg &&\
  docker-php-ext-install -j$(nproc) gd zip
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer
