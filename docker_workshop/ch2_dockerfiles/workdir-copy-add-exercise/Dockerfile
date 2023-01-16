# WORKDIR, COPY and ADD example
FROM ubuntu:latest
RUN apt-get update && apt-get install apache2 -y
WORKDIR /var/www/html/
COPY index.html .
ADD https://www.docker.com/wp-content/uploads/2022/12/Docker-Temporary-Image-Social-Thumbnail-1200x630-1.png ./logo.png
CMD ["ls"]