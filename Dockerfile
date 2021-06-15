FROM nginx:1.21

RUN set -ex; \
    rm /etc/nginx/conf.d/default.conf; \
    apt-get update; \
    apt-get install -y uuid; \
    rm -rf /var/lib/apt/lists/*

COPY nginx.conf.template /etc/nginx/templates/tls-proxy.conf.template
COPY tls-nginx.sh /docker-entrypoint.d/tls-nginx.sh

ENV REMOTE_URL="http://localhost:8080/"
EXPOSE 443
