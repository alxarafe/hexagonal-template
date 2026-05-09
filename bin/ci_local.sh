#!/bin/bash
set -euo pipefail

echo "Running PHP tests..."

# ─────────────────────────────────────────────
# Ensure Docker services are running
# ─────────────────────────────────────────────

if ! docker compose ps | grep -q "hexagonal_php"; then
    echo "❌ PHP container is not running"
    exit 1
fi

if ! docker compose ps | grep -q "app_java"; then
    echo "❌ Java container is not running"
    exit 1
fi

# ─────────────────────────────────────────────
# Ensure dependencies (PHP)
# ─────────────────────────────────────────────

if [ ! -d "vendor" ]; then
    echo "Vendor not found. Bootstrapping dependencies..."
    docker compose exec hexagonal_php composer install --no-interaction
fi

# ─────────────────────────────────────────────
# PHP tests
# ─────────────────────────────────────────────

docker compose exec hexagonal_php vendor/bin/phpunit

echo "Running Java tests..."

# ─────────────────────────────────────────────
# Java tests
# ─────────────────────────────────────────────

docker compose exec app_java mvn test

echo "All tests passed"