# containers

------


# The Docker Workshop
This is based on the repository for
[The Docker Workshop](https://github.com/PacktWorkshops/The-Docker-Workshop), 
published by [Packt](https://www.packtpub.com/?utm_source=github). 


#### Requirements and Setup
<a href="https://www.amazon.com/Docker-Workshop-containers-effectively-development/dp/1838983449/ref=tmm_pap_swatch_0?_encoding=UTF8&qid=1611064488&sr=1-1&utm_source=github&utm_medium=repository&utm_campaign=9781838983444&utm_term=Docker&utm_content=The%20Docker%20Workshop"><img src="https://github.com/PacktWorkshops/Workshop-Covers/blob/master/The%20Docker%20Workshop.png" alt="The Docker Workshop" height="290px" width="230px" align="right" this.target="_blank"></a>

To get started with the project files, you'll need to:
* Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* Create a free [Docker account](https://hub.docker.com/)
* Install Docker
---

# How to create a great dev environment with Docker
[Youtube](https://www.youtube.com/watch?v=0H2miBK_gAk)

[Repo](https://github.com/patrickloeber/python-docker-tutorial)

*  cd docker_dev_environment/
*  docker build -t fastapi-image .
*  docker images
*  docker run --name fastapi-container -p 80:80 fastapi-image
*  docker ps -a
*  docker rm fastapi-container
*  docker run --name fastapi-container -p 80:80 -d fastapi-image
*  docker ps -a
*  docker stop fastapi-container
*  docker rm fastapi-container
*  docker run --name fastapi-container -p 80:80 -d -v $(pwd):/code fastapi-image

#### Extensions for Visual Studio Code
  * python
  * docker
  * dev containers

*  docker stop fastapi-container
*  docker rm fastapi-container
---
#### Docker Compose

*  touch docker-compose.yml
*  docker-compose up
*  docker-compose down
*  docker-compose up --build -d
*  docker ps
*  docker-compose up --build -d
*  docker ps -a
*  docker-compose down
*  docker-compose up --build -d
*  docker-compose down

---

# Microservice Architecture and System Design with Python & Kubernetes – Full Course

[Youtube](https://www.youtube.com/watch?v=hmkF77F9TLw&t=2353s)

* [Kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

* [minikube](https://minikube.sigs.k8s.io/docs/start/)
* [k9s](https://github.com/derailed/k9s)
* [source repo](https://github.com/selikapro/microservices-python)
---
* brew install mysql
* brew services start mysql 
* mysql -uroot
---
---
* brew remove mysql 
* brew cleanup
* [install mysql ubuntu22.04](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-22-04)
* [install2 mysql ubuntu22.04](https://askubuntu.com/questions/1405475/unable-to-install-mysql-server-on-ubuntu-22-04-lts)

```
MySQL is configured to only allow connections from localhost by default

To connect run:
    mysql -u root

To start mysql now and restart at login:
  brew services start mysql
```

### solution for "NameError: name '_mysql' is not defined" issue:
https://github.com/PowerDNS-Admin/PowerDNS-Admin/issues/570
```commandline

"

You may need to install the Python 3 and MySQL development headers and libraries like so:

$ sudo apt-get install python3-dev default-libmysqlclient-dev build-essential # Debian / Ubunt

Then you can install mysqlclient via pip now:
$ pip install mysqlclient

"
```
