FROM python:3.6.2-jessie

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
                build-essential \
                python-dev \
                unzip \
        && pip install uwsgi \
        && wget https://code.jquery.com/jquery-3.2.1.slim.min.js \
        && wget https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js \
        && wget https://github.com/twbs/bootstrap/releases/download/v4.0.0-beta/bootstrap-4.0.0-beta-dist.zip \
        && unzip bootstrap-4.0.0-beta-dist.zip \
        && rm bootstrap-4.0.0-beta-dist.zip

ENV INSTALL_PATH /python/app

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY config.py run.py uwsgi.ini ./
COPY project/ project/

ENTRYPOINT ["uwsgi", "--ini", "uwsgi.ini"]
