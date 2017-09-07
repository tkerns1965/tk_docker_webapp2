FROM python:3.6.2-jessie

RUN apt update && \
    apt install -y build-essential python-dev && \
    pip install uwsgi

ENV INSTALL_PATH /python/app
# ENV SOCKET_PATH /python/socket

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY hello.py uwsgi.ini ./

# RUN mkdir $SOCKET_PATH && \
#     chown www-data:www-data $SOCKET_PATH
# VOLUME $SOCKET_PATH

ENTRYPOINT ["uwsgi", "--ini", "uwsgi.ini"]
