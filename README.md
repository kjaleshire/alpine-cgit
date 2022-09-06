A hyperfast web frontend for git repositories written in C running on Alpine Linux.

```
docker run -d \
  --name=alpine-cgit \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Berlin \
  -p 80:80 \
  -v /path/to/config/files:/config \
  --restart unless-stopped \
  chruth/alpine-cgit:latest
```
