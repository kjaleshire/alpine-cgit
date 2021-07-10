# [alpine-cgit](https://github.com/chruth/alpine-cgit)

Alpine Linux with **CGIT** and **NGINX** 

[![Github Actions](https://github.com/chruth/alpine-cgit/actions/workflows/docker-image-ci.yml/badge.svg)](https://github.com/chruth/alpine-cgit/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/chruth/alpine-cgit?style=flat-square)](https://hub.docker.com/r/chruth/alpine-cgit)
[![GitHub](https://img.shields.io/github/license/chruth/alpine-cgit?style=flat-square)](https://github.com/chruth/alpine-cgit/blob/master/LICENSE)

# Usage

### docker

```
docker run -d \
  --name=alpine-cgit \
  -p 80:80 \
  -v <path/for/config/files>:/config \
  --restart unless-stopped \
  chruth/alpine-cgit
```


### docker-compose

```
---
version: '3'
services:
  alpine-cgit:
    image: chruth/alpine-cgit
    container_name: alpine-cgit
    ports:
    - "80:80"
    volumes:
    - <path/for/config/files>:/config
    restart: unless-stopped
```

### Optional settings

| setting | default value |
| :---: | --- |
| -e PUID | 1000 |
| -e PGID | 1000 |
| -e TZ | Europe/Berlin |
| -v \<path/for/app/files\>:/app |  |
