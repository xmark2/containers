FROM continuumio/anaconda3

RUN apt-get install curl wget tar
COPY ./requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt

WORKDIR /myproject

# VERSIONS
ENV SPARK_VERSION=3.3.2 \
HADOOP_VERSION=3 \
JAVA_VERSION=11

# SET JAVA ENV VARIABLES
ENV JAVA_HOME="/home/jdk-${JAVA_VERSION}.0.2"
ENV PATH="${JAVA_HOME}/bin/:${PATH}"

# SET ENV SPARK_FILE ENV, DOWNLOAD_URL
ENV SPARK_FILE="spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz"
ENV DOWNLOAD_URL_SPARK="https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/${SPARK_FILE}"

# DOWNLOAD JAVA 11 AND INSTALL
RUN DOWNLOAD_URL="https://download.java.net/java/GA/jdk${JAVA_VERSION}/9/GPL/openjdk-${JAVA_VERSION}.0.2_linux-x64_bin.tar.gz" \
    && TMP_DIR="$(mktemp -d)" && curl -fL "${DOWNLOAD_URL}" --output "${TMP_DIR}/openjdk-${JAVA_VERSION}.0.2_linux-x64_bin.tar.gz" \
    && mkdir -p "${JAVA_HOME}" && tar xzf "${TMP_DIR}/openjdk-${JAVA_VERSION}.0.2_linux-x64_bin.tar.gz" -C "${JAVA_HOME}" --strip-components=1 \
    && rm -rf "${TMP_DIR}" && java --version

# DOWNLOAD SPARK AND INSTALL
RUN mkdir -p /home/spark && wget "${DOWNLOAD_URL_SPARK}" -P /home/spark
RUN tar -xf /home/spark/${SPARK_FILE} -C /home/spark --strip-components=1

# SET SPARK ENV VARIABLES
ENV SPARK_HOME="/home/spark"
ENV PATH="${SPARK_HOME}/bin/:${PATH}"

# SET PYSPARK VARIABLES
ENV PYTHONPATH="${SPARK_HOME}/python/:$PYTHONPATH"
ENV PYTHONPATH="${SPARK_HOME}/python/lib/py4j-0.10.9.5-src.zip:$PYTHONPATH"

# Let's change to  "$NB_USER" command so the image runs as a non root user by default
USER $NB_UID

ENTRYPOINT ["python" ]