FROM redis:alpine as redis-builder

FROM caddy:2-alpine as caddy-builder

FROM searxng/searxng:latest as runner

# arm64 or amd64
ARG PLATFORM
ARG ARCH

USER root

RUN apk add tini bash git curl sudo yq && \
    rm -f /var/cache/apk/* && \
    mkdir -p /var/lib/redis && mkdir -p /etc/caddy/ && mkdir -p /data && mkdir -p /config

WORKDIR /etc/
COPY searxng-docker/ .

COPY --from=redis-builder /usr/local/bin/ /usr/local/bin/
COPY --from=caddy-builder /etc/caddy/Caddyfile /etc/caddy/Caddyfile
COPY --from=caddy-builder /data /data
COPY --from=caddy-builder /config /config
COPY settings.yml searxng/settings.yml
COPY searxng.png /usr/local/searxng/searx/static/themes/simple/img/searxng.png
COPY searxng.svg /usr/local/searxng/searx/static/themes/simple/img/searxng.svg

ADD docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/*.sh
