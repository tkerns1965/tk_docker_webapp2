FROM mariadb:10.2.8

ENV SECRET_PATH /run/secrets

ENV MYSQL_ROOT_PASSWORD_FILE $SECRETS_PATH/mariadb-root-password
ENV MYSQL_DATABASE_FILE      $SECRETS_PATH/mariadb-database
ENV MYSQL_USER_FILE          $SECRETS_PATH/mariadb-user
ENV MYSQL_PASSWORD_FILE      $SECRETS_PATH/mariadb-password

RUN rm /etc/mysql/my.cnf && \
    rm /etc/mysql/debian.cnf
    
COPY *.cnf /etc/mysql/
COPY secrets/. $SECRETS_PATH/
COPY sql/. /docker-entrypoint-initdb.d/
