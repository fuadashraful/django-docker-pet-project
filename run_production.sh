#!/bin/sh


case $1 in 
"start")
  docker compose -f docker-compose.prod.yml up -d --build
  ;;
"down")
  docker compose -f docker-compose.prod.yml down -v
  ;;
"migrate")
  docker compose -f docker-compose.prod.yml exec web python manage.py migrate --noinput
  ;;
"collectstatic")
  docker compose -f docker-compose.prod.yml exec web python manage.py collectstatic --no-input --clear
  ;;
"logs")
  docker compose -f docker-compose.prod.yml logs -f
  ;;
esac