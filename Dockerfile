FROM php:alpine3.11

LABEL maintainer davidg <2627472+davidg-endor@users.noreply.github.com>

ENV TINYFILEMANAGER_VERSION 2.4.1

RUN apk --update add oniguruma-dev zip libzip-dev && \
    docker-php-ext-install zip fileinfo iconv mbstring

WORKDIR /app/
COPY assets /app/assets
COPY tinyfilemanager.php /app/tinyfilemanager.php

ENTRYPOINT ["php"]
CMD ["-S", "0.0.0.0:80", "tinyfilemanager.php"]