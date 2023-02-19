#FROM pyspark:3.10-slim
#LABEL maintainer=xmark2@gmail.com
#
##RUN apt-get update && apt upgrade -y
#
#WORKDIR /myproject
#
#COPY ./requirements.txt ./
#RUN pip install --no-cache-dir --upgrade -r requirements.txt

#COPY ./mycodes ./mycodes
FROM python:3.10
LABEL maintainer=xmark2@gmail.com

#RUN pip install pandas

WORKDIR /myproject
COPY ./requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt
#COPY fhvhv_tripdata_2021-01.csv.gz .


# VERSIONS
ENV SPARK_VERSION=3.3.1 \
HADOOP_VERSION=3 \
JAVA_VERSION=11

# SET JAVA ENV VARIABLES
ENV JAVA_HOME="/home/jdk-${JAVA_VERSION}.0.2"
ENV PATH="${JAVA_HOME}/bin/:${PATH}"

# DOWNLOAD JAVA 11 AND INSTALL
#RUN apt-get install curl wget default-jre openjdk-11-jre-headless mlocate git scala jupyter-core
RUN apt-get install curl wget
RUN wget "https://dlcdn.apache.org/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.tgz"
#RUN wget "https://download.java.net/java/GA/jdk${JAVA_VERSION}/9/GPL/openjdk-${JAVA_VERSION}.0.2_linux-x64_bin.tar.gz"
#RUN DOWNLOAD_URL="https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz"

# SET SPARK ENV VARIABLES
ENV SPARK_HOME="/home/spark"
ENV PATH="${SPARK_HOME}/bin/:${PATH}"

# SET PYSPARK VARIABLES
ENV PYTHONPATH="${SPARK_HOME}/python/:$PYTHONPATH"
ENV PYTHONPATH="${SPARK_HOME}/python/lib/py4j-0.10.9.5-src.zip:$PYTHONPATH"

# Let's change to  "$NB_USER" command so the image runs as a non root user by default
USER $NB_UID

ENTRYPOINT ["python" ]