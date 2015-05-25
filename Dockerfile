# Build nginx with Docker

FROM justincormack/frankenlibc

MAINTAINER Justin Cormack

COPY . /usr/src/rump-nginx

WORKDIR /usr/src/rump-nginx

ENV RUMPRUN_CC rumprun-cc

RUN make && cp bin/nginx /usr/local/bin && make clean 
