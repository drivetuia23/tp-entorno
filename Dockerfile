FROM ubuntu:latest

RUN apt-get update && apt-get upgrade && apt-get install -y imagemagick && apt-get install -y wget

RUN  apt-get install -y figlet && apt-get install -y git

RUN git clone https://github.com/drivetuia23/tp-entorno.git

WORKDIR /tp-entorno

CMD /tp-entorno/menu.sh

