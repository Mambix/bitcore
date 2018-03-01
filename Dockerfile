FROM node:4
MAINTAINER Mambix Ltd. <ledi.mambix@gmail.com>

RUN apt-get update && apt-get install -y \
  libzmq3-dev \
  build-essential

EXPOSE 3001 8333 18333

RUN npm install -g bitcore

ENTRYPOINT [ "bitcored" ]
