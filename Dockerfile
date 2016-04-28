FROM pataquets/ubuntu:trusty

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y --no-install-recommends install sslh \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "sslh", "-f" ]
CMD [ "-p", "0.0.0.0:80", "-p", "0.0.0.0:443", "--http", "localhost:81", "--ssl", "localhost:444", "--openvpn", "127.0.0.1:1192" ]
