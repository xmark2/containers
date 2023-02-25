FROM python:3.9.1

RUN apt-get install curl wget tar bash
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

# DOWNLOAD ANACONDA3 AND INSTALL
RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

#RUN apt-get install -y curl grep sed dpkg && \
#    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
#    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
#    dpkg -i tini.deb && \
#    rm tini.deb && \
#    apt-get clean

ENV PATH /opt/conda/bin:$PATH


#RUN DOWNLOAD_ANACONDA_URL="https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh" \
#    && wget ${DOWNLOAD_ANACONDA_URL} -P /home/anaconda
#RUN /home/anaconda/anaconda.sh

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

#ENTRYPOINT ["conda" ]