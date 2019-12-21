# alpine-cgit

Alpine base image with s6-ovleray, NGINX (stable) and CGIT (latest commit)

# Usage

### docker

```
docker run -d \
  --name=alpine-cgit \
  -p 80:80 \
  -v <path for config files>:/config \
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
    - <path for config files>:/config
    restart: unless-stopped
```

### Optional settings

| setting | default value |
| :---: | --- |
| -e PUID | 1000 |
| -e PGID | 1000 |
| -v \<path for app files\>:/app |  |
