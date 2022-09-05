FROM php:8.0-fpm-bullseye
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apt-get update && apt-get install -y \
  graphviz \
  aspell \
  ghostscript \
  clamav

RUN chmod +x /usr/local/bin/install-php-extensions && \
  install-php-extensions pspell curl gd intl xml xmlrpc ldap zip soap mbstring mysqli opcache exif redis

RUN mkdir /var/moodledata && \
  chown -R www-data /var/moodledata && \
  chmod -R 777 /var/moodledata

RUN mkdir /app
COPY . /app
