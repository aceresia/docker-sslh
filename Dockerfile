FROM ubuntu:trusty

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y --no-install-recommends install sslh \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "sslh", "-f" ]
CMD [ "-p", "0.0.0.0:80", "-p", "0.0.0.0:443", "--http", "http:80", "--ssl", "https:443", "--openvpn", "openvpn:1192" ]
