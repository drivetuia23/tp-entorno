FROM ubuntu:latest

RUN apt-get update && apt-get upgrade && apt-get install -y imagemagick && apt-get install -y wget

RUN  apt-get install -y figlet

RUN git clone https://github.com/drivetuia23/tp-entorno.git

# COPY generar.sh descomprimir.sh procesar.sh comprimir.sh verificaciones.sh titulo.sh  menu.sh /Workspace/

WORKDIR /tp-entorno

CMD ["bash", "tp-entorno/menu.sh"]

