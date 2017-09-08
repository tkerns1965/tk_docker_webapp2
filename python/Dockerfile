FROM python:3.6.2-jessie

RUN apt update && \
    apt install -y build-essential python-dev && \
    pip install uwsgi

ENV INSTALL_PATH /python/app

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY run.py uwsgi.ini ./

ENTRYPOINT ["uwsgi", "--ini", "uwsgi.ini"]
