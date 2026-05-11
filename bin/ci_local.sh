#!/bin/bash
set -euo pipefail

echo "Running PHP tests..."

# ─────────────────────────────────────────────
# Ensure Docker services are running
# ─────────────────────────────────────────────

if ! docker compose ps | grep -q "php-app"; then
    echo "❌ PHP container is not running"
    exit 1
fi

if ! docker compose ps | grep -q "java-app"; then
    echo "❌ Java container is not running"
    exit 1
fi

# ─────────────────────────────────────────────
# Ensure dependencies (PHP)
# ─────────────────────────────────────────────

echo "Bootstrapping dependencies..."
docker compose exec php-app composer install --no-interaction

# ─────────────────────────────────────────────
# PHP tests
# ─────────────────────────────────────────────

docker compose exec php-app vendor/bin/phpunit

echo "Running Java tests..."

# ─────────────────────────────────────────────
# Java tests
# ─────────────────────────────────────────────

docker compose exec java-app mvn test

echo "All tests passed"