FROM alpine:latest
LABEL maintainer="me@roxet.net"

ENV HUGO_VERSION=0.36.1
ENV CADDY_VERSION=0.10.11

RUN apk add --update wget ca-certificates && \
  cd /tmp/ && \
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  mv hugo /usr/bin/ && \
  rm -rf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz README.md LICENSE.md && \
  wget https://github.com/mholt/caddy/releases/download/v${CADDY_VERSION}/caddy_v${CADDY_VERSION}_linux_amd64.tar.gz && \
  tar xzvf caddy_v${CADDY_VERSION}_linux_amd64.tar.gz && \
  mv caddy /usr/bin/caddy && \
  rm -rf init/ CHANGES.txt LICENSE.txt README.txt && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*

EXPOSE 2015

COPY Caddyfile /etc/Caddyfile
COPY site /site
RUN cd /site && hugo && cp -R public/* /srv

WORKDIR /srv
ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]