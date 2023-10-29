FROM ubuntu:22.04

RUN apt-get update

RUN apt-get install -y python3 \
    && apt-get install -y python3-pip \
    && mkdir - /app

COPY requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY ./app /app/
RUN useradd -d /app -s /bin/bash testUser \
    && chown -R testUser /app
USER testUser

ENTRYPOINT ["python3", "app.py"]