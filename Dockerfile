FROM --platform=linux/arm64/v8 searxng/searxng

ENV PORT 8080
ENV INSTANCE_NAME searxng
ENV AUTOCOMPLETE true
ENV BASE_URL searxng.embassy:$PORT

RUN apk add tini bash git curl sudo

ADD docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
ADD scripts/check-web.sh /usr/local/bin/check-web.sh
RUN chmod a+x /usr/local/bin/*.sh
