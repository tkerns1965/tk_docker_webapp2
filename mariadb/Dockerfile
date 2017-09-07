FROM mariadb:10.2.8

ENV MYSQL_ROOT_PASSWORD 2hard4u*
ENV MYSQL_DATABASE timesheets
ENV MYSQL_USER tony
ENV MYSQL_PASSWORD 2hard4u

RUN rm /etc/mysql/my.cnf && \
    rm /etc/mysql/debian.cnf
COPY my.cnf debian.cnf /etc/mysql/
COPY sql/. /docker-entrypoint-initdb.d/
