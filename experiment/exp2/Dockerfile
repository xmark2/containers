FROM python:3.10-slim

WORKDIR /code

COPY code/requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY code ./code

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]