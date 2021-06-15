# localhost-nginx

[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/bpholt/localhost-nginx?style=for-the-badge)](https://hub.docker.com/r/bpholt/localhost-nginx)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/bpholt/localhost-nginx?style=for-the-badge)](https://hub.docker.com/r/bpholt/localhost-nginx)
[![License](https://img.shields.io/github/license/bpholt/localhost-nginx?style=for-the-badge)](https://github.com/bpholt/localhost-nginx/blob/main/LICENSE)

Run an nginx server with a self-signed TLS certificate on https://localhost.

```shell
docker run \
  --rm \
  --env REMOTE_URL=http://localhost:8080 \
  --publish 443:443 \
  --publish 80:80 \
  bpholt/localhost-nginx
```
