#!/bin/bash
while ! nc -z db 5432; do
  sleep 1
done

python manage.py migrate
exec gunicorn kittygram_backend.wsgi:application --bind 0.0.0.0:8000