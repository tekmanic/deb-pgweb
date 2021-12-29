FROM debian:bullseye-slim
LABEL org.opencontainers.image.authors="tekmanic"
ENV PGWEB_VERSION 0.11.9

RUN \
  apt-get update && \
  apt-get -y install ca-certificates openssl postgresql wget unzip && \
  update-ca-certificates && \
  cd /tmp && \
  wget -q https://github.com/sosedoff/pgweb/releases/download/v$PGWEB_VERSION/pgweb_linux_amd64.zip && \
  unzip pgweb_linux_amd64.zip -d /usr/bin && \
  mv /usr/bin/pgweb_linux_amd64 /usr/bin/pgweb && \
  rm -f pgweb_linux_amd64.zip && \
  apt-get remove -y --purge wget unzip && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8081
CMD ["/usr/bin/pgweb", "--bind=0.0.0.0", "--listen=8081"]