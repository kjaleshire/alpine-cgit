FROM chruth/alpine-base:latest

# build options
ARG \
  MAKEOPTS=" \
    LUA_PKGCONFIG=lua5.4 \
    NO_GETTEXT=YesPlease \
    NO_ICONV=YesPlease \
    NO_REGEX=NeedsStartEnd \
    NO_SVN_TESTS=YesPlease \
    NO_TCLTK=YesPlease \
    prefix=/usr"

COPY rootfs /

# install packages
RUN \
  # build packages
  apk add --update --no-cache --virtual=build-dependencies \
    g++ \
    gcc \
    make \
    lua5.4-dev \
    zlib-dev \
    openssl-dev \
    git \
    asciidoc && \
  # runtime packages
  apk add --update --no-cache \
    python3 \
    py3-markdown \
    py3-pygments \
    nginx \
    fcgiwrap \
    spawn-fcgi \
    lua5.4-libs \
    zlib && \
  # build cgit
  git clone https://git.zx2c4.com/cgit /tmp/cgit && cd /tmp/cgit && \
  git submodule init && \
  git submodule update && \
  make all ${MAKEOPTS} && \
  make install ${MAKEOPTS} CGIT_SCRIPT_PATH=/app CGIT_CONFIG=/config/cgitrc && \
  # make scripts executable
  chmod +x /etc/s6-overlay/scripts/* && \
  # cleanup
  apk del --purge build-dependencies && \
  rm -rf /tmp/*

EXPOSE 80

VOLUME ["${APP_DIR}"]
