FROM ubuntu:16.04

# Install required packages and remove the apt packages cache when done.

RUN apt-get update && \
    apt-get upgrade -y && \ 	
    apt-get install -y \
	nano \	
	git \
	python3 \
	python3-dev \
	python3-setuptools \
	python3-pip \
	nginx \
	sqlite3 && \
	pip3 install -U pip setuptools && \
   rm -rf /var/lib/apt/lists/*

RUN pip3 install uwsgi

# setup all the configfiles
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx-app.conf /etc/nginx/sites-available/default
COPY app/requirements.txt /home/docker/code/app/
RUN pip3 install -r /home/docker/code/app/requirements.txt

# add all the files
COPY . /home/docker/code/
WORKDIR home/docker/code/app
COPY ./startpoint.sh ./
RUN chmod 755 ./startpoint.sh

EXPOSE 8000
ENTRYPOINT ["./startpoint.sh"]


#CMD ["supervisord", "-n"]
