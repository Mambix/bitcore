FROM node:4
MAINTAINER Mambix Ltd. <ledi.mambix@gmail.com>

EXPOSE 3001 8333 18333

RUN npm install -g bitcore

ENTRYPOINT [ "bitcored" ]
