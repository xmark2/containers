FROM basic-base

ARG GIT_COMMIT=unknown
LABEL git-commit=$GIT_COMMIT

CMD mkdir -p /var/www/html/

WORKDIR /var/www/html/

ADD Dockerfile.tar.gz /var/www/html/
RUN cat Dockerfile