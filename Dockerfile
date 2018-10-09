FROM ubuntu:18.04

MAINTAINER Shane Nelson

RUN apt-get update && apt-get install -y \
        curl \
        gcc g++ make gnupg; \
    curl -sL https://deb.nodesource.com/setup_8.x | bash; \
    apt-get install -y nodejs

COPY ./start.sh /var/www/start.sh
RUN chmod u+x /var/www/start.sh
