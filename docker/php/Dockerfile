FROM php:8.4-cli

# ─────────────────────────────────────────────
# System dependencies
# ─────────────────────────────────────────────
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    curl \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

# ─────────────────────────────────────────────
# Composer
# ─────────────────────────────────────────────
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# ─────────────────────────────────────────────
# Xdebug (installed but NOT enabled by default mode)
# ─────────────────────────────────────────────
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# ─────────────────────────────────────────────
# PHP config
# ─────────────────────────────────────────────
COPY docker/php/php.ini /usr/local/etc/php/php.ini

# Xdebug config (DISABLED by default)
COPY docker/php/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# ─────────────────────────────────────────────
# Workdir
# ─────────────────────────────────────────────
WORKDIR /var/www/php

# ─────────────────────────────────────────────
# Default command (IMPORTANT FIX)
# ─────────────────────────────────────────────
CMD ["tail", "-f", "/dev/null"]