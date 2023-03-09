#!/bin/sh


if ["$DATABASE" = "postgres"]
then
  echo "Waiting for postgres ..."

  while ! nc -z  $SQL_HOST $SQL_PORT; do
    echo "Waiting to connect with postgres"
    sleep 0.1
  done

  echo "Postgres started !!!"

fi

python manage.py flush --no-input
python manage.py migrate

exec "$@"