#!/bin/bash

# Wait for DB (optional, if using Compose and Postgres)
# echo "Waiting for database..."
# while ! nc -z db 5432; do
#   sleep 0.1
# done
# echo "Database started"

# Apply migrations
python app/manage.py makemigrations --noinput --settings=main.settings.prod
python app/manage.py migrate --noinput --settings=main.settings.prod

# Collect static files
python app/manage.py collectstatic --noinput --settings=main.settings.prod

# Start server
exec "$@"
