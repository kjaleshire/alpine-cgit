FROM chruth/alpine-base
LABEL maintainer="chruth"

# build options
ARG \
  makeopts="NO_ICONV=YesPlease NO_GETTEXT=YesPlease NO_TCLTK=YesPlease NO_SVN_TESTS=YesPlease NO_REGEX=NeedsStartEnd LUA_PKGCONFIG=lua5.3 prefix=/usr"

COPY rootfs /

# install packages
RUN \
  # build packages
  apk add --update --no-cache --virtual=build-dependencies \
    g++ \
    gcc \
    make \
    lua5.3-dev \
    zlib-dev \
    openssl-dev \
    asciidoc && \
  # runtime packages
  apk add --update --no-cache \
    python3 \
    py3-markdown \
    py3-pygments \
    nginx \
    git \
    fcgiwrap \
    spawn-fcgi \
    lua5.3-libs \
    zlib && \
  # build cgit
  git clone https://git.zx2c4.com/cgit /tmp/cgit && cd /tmp/cgit && \
  git submodule init && \
  git submodule update && \
  make all ${makeopts} && \
  make install ${makeopts} CGIT_SCRIPT_PATH=/app CGIT_CONFIG=/config/cgitrc && \
  # cleanup
  apk del --purge build-dependencies && \
  rm -rf /tmp/*

EXPOSE 80

VOLUME ["${APP_DIR}"]