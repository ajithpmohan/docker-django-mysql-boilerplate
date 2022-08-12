#!/bin/bash

if [ "$SQL_HOST" = "db" ]
then
    echo "Waiting for mysql..."

    while !</dev/tcp/$SQL_HOST/$SQL_PORT; do sleep 1; done;

    echo "MySQL started"
fi

# python manage.py migrate

exec "$@"
