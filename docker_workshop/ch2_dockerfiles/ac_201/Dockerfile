FROM ubuntu:18.04
LABEL maintainer=xmark2
LABEL version=1.0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&  \
    apt-get install apache2 -y \
    php \
    curl

COPY *.php /var/www/html

WORKDIR /var/www/html

HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD curl -f http://localhost || exit 1

EXPOSE 80

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]