#!/bin/bash
python3 manage.py makemigrations
python3 manage.py migrate                  # Apply database migrations
python3 manage.py collectstatic --noinput  # Collect static files

# Start the app
echo Starting the app.
/etc/init.d/nginx restart
tail -n 0 -f /var/log/nginx/*.log &



# for django server
# exec python3 manage.py runserver 0.0.0.0:8000 "$@"

# for uWSGI without nginx
# exec uwsgi --http :8000 --module Satelite_Tracking.wsgi "$@"

# for uWSGI with nginx with uwsgi.ini file config
# exec uwsgi --socket :8001 --module Satelite_Tracking.wsgi "$@"


# for uWSGI with nginx with uwsgi.ini file config

exec uwsgi --ini uwsgi.ini "$@"

