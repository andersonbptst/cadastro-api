FROM postgres:15

COPY ./setup/data/postgres.tar /tmp/postgres.tar
COPY ./setup/scripts/setup.sh /docker-entrypoint-initdb.d/setup.sh

RUN chmod 777 /docker-entrypoint-initdb.d/setup.sh