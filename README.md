# single-docker-nginx-uwsgi-django
Configuration of docker, nginx, uWSGI to serve Django application.
## Starting the application ##
- Application alone can be found in /app subdirectory and run with django developer server: **./manage.py runserver**. In that case
application can be accessed by typing: **localhost:8000** in the browser
- To build docker image you should enter build_folder (where the Dockerfile is) and run: **sudo docker build -t my_app**
- After building the image, it is possible to run the application: **sudo docker run -p 8000:8000 -t my_app**. Application will
be accessible at: **0.0.0.0:8000** (it is also possible to access the running application by your local machine ip 
address - check by *$ ifconfig* or *$ ip add* in the console on port 8000)

## Restarting running uWSGI to reload changes in the code ##
The running Docker image with nginx and uWSGI serving Django won't automatically reload whole application. To reload it one must 
follow these steps:
- log into running Docker image: check ID of the Docker container you want to log into by *$ sudo docker ps*, 
- log in: *$ sudo docker exec <container_ID> /bin/bash*
- after getting into the container, make sure you are in the same directory as *uwsgi_reload* file, 
then type: *$ touch uwsgi_reload* in the console. uWsgi will start chain_reload procedure.

## Configuration files ##
- Docker: /build_folder/Dockerfile
- uWSGI: /build_folder/app/uwsgi.ini
- nginx: /build_folder/nginx-app.conf
- Django: /build_folder/app/Satelite_Tracking/settings.py

## Links ##
- uWSGI: http://uwsgi-docs.readthedocs.io/en/latest/index.html
- More about uWSGI chain_reload: http://uwsgi-docs.readthedocs.io/en/latest/articles/TheArtOfGracefulReloading.html#chain-reloading-lazy-apps
- Installation of docker: https://docs.docker.com/engine/installation/
- nginx: http://nginx.org/en/docs/beginners_guide.html
