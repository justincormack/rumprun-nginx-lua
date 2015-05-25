# Build nginx with Docker

FROM justincormack/rump-lua

MAINTAINER Justin Cormack

COPY . /usr/src/rump-nginx-lua

WORKDIR /usr/src/rump-nginx-lua

ENV RUMPRUN_CC=rumprun-cc \
  LUA_LIB=/usr/local/lib \
  LUA_INC=/usr/local/include \
  DEVEL_KIT_PATH=/usr/src/rump-nginx-lua/ngx_devel_kit-0.2.19 \
  LUA_MOD_PATH=/usr/src/rump-nginx-lua/lua-nginx-module-0.9.15 \
  PCRE_PATH=/usr/src/rump-nginx-lua/pcre-8.37

RUN \
  curl https://codeload.github.com/simpl/ngx_devel_kit/tar.gz/v0.2.19 | tar xzf - && \
  curl https://codeload.github.com/openresty/lua-nginx-module/tar.gz/v0.9.15 | tar xzf - && \
  curl ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.37.tar.gz | tar xzf - && \
  make && cp bin/nginx /usr/local/bin && make clean && \
  rm -rf ngx_devel_kit-0.2.19 lua-nginx-module-0.9.15 pcre-8.37
