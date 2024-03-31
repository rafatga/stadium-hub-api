# Use multi-stage builds for better layer management
# Node stage for installing node dependencies
FROM node:21-alpine AS node

# PHP stage for running PHP application
FROM php:8.3-fpm-alpine

# Install necessary system dependencies
RUN apk --no-cache add \
    libstdc++ \
    libgcc \
    icu-dev \
    icu-data-full \
    wget \
    curl \
    git \
    grep \
    openssl-dev \
    build-base \
    libmemcached-dev \
    libmcrypt-dev \
    libxml2-dev \
    imagemagick-dev \
    pcre-dev \
    libtool \
    make \
    autoconf \
    g++ \
    vim \
    bash \
    nano \
    cyrus-sasl-dev \
    libgsasl-dev \
    supervisor

# Copy Node dependencies and binaries from the Node stage
COPY --from=node /usr/local/ /usr/local/

# Set timezone
RUN echo "Europe/Berlin" > /etc/timezone

# Define PHP extension dependencies
ENV EXT_DEPS \
    pkgconfig \
    libxml2-dev \
    libxslt \
    libxslt-dev \
    gnupg \
    dialog \
    zlib-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libzip-dev \
    gettext-dev

# Install PHP extensions
RUN set -xe; \
    apk --no-cache update && apk --no-cache upgrade \
    && apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community gnu-libiconv \
    && apk add --no-cache $EXT_DEPS \
    && docker-php-ext-configure exif \
    && docker-php-ext-install exif \
    && docker-php-ext-configure bcmath \
    && docker-php-ext-install bcmath \
    && docker-php-ext-configure gd \
    && docker-php-ext-install gd \
    && docker-php-ext-configure xsl \
    && docker-php-ext-install xsl \
    && docker-php-ext-enable xsl \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure gettext \
    && docker-php-ext-install gettext \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    && docker-php-ext-configure opcache \
    && docker-php-ext-install opcache \
    && docker-php-ext-configure pdo_mysql \
    && docker-php-ext-install pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Install cross-env globally using npm
RUN npm install --global cross-env

# Set up directory permissions and ownership
WORKDIR /var/www/html
RUN mkdir -p /socket var/cache var/log \
    && chmod 777 /socket var/cache var/log \
    && chown 1000:1000 /socket var/cache var/log

# Switch to non-root user
USER www-data
## Because CMD and ENTRYPOINT work in tandem, they can often be confusing to understand.
## However, they have different effects and exist to increase your image's flexibility:
## ENTRYPOINT sets the process to run, while CMD supplies default arguments to that process.
## https://spacelift.io/blog/docker-entrypoint-vs-cmd
## https://devtron.ai/blog/cmd-and-entrypoint-differences/
#ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
CMD ["./ops/scripts/docker-run-dev.sh","/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
