# FROM ubuntu:20.04
FROM python:alpine

LABEL maintainer=xmark2@gmail.com
# RUN apt-get update
WORKDIR /src/
# COPY "./test.sh" .
COPY ./src/* /src/
ADD https://img.freepik.com/free-photo/grunge-paint-background_1409-1337.jpg /src/saved_picture.jpg
RUN chmod +x /code/test.sh
# CMD ["chmod", "+x", "/test.sh"]
#CMD ["echo", "The Docker Workshop"]
ENTRYPOINT ["/src/test.sh"]
#ENTRYPOINT ["echo", "You are reading"]