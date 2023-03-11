FROM jupyter/pyspark-notebook

#RUN apt-get install curl wget tar bash
COPY ./requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt

WORKDIR /myproject

#CMD ["jupyter notebook --notebook-dir=/myproject --ip='*' --port=8888 --no-browser --allow-root"
#ENTRYPOINT ["conda" ]