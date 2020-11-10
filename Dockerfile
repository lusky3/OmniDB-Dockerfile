# Use phusion/baseimage as base image.
FROM phusion/baseimage:bionic-1.0.0

# OmniDB version
ARG VERSION=2.17.0

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Setup a software baseline, later updated at run time
RUN export DEBIAN_FRONTEND=noninteractive && \
  mkdir -p /etc/my_init.d && \
  apt-get -qq -y update && \
  apt-get dist-upgrade -y -qq -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" && \
  apt-get install -qq -y --no-install-recommends -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" \
    ca-certificates \
    curl \
    unzip \
    wget  && \
  apt-get -y -qq -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" autoremove && \
  ln -s /bin/echo /bin/systemctl && \
  cd /tmp && \
  wget https://github.com/OmniDB/OmniDB/releases/download/${VERSION}/omnidb-server_${VERSION}-debian-amd64.deb && \
  dpkg -i omnidb-server_${VERSION}-debian-amd64.deb && \
  unset DEBIAN_FRONTEND && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy runtime scripts and make executable
COPY scripts/* /etc/my_init.d/
RUN chmod +x /etc/my_init.d/*

# Setup ennvironment variables
ENV LISTENING_PORT="8000" \
LISTENING_ADDRESS="0.0.0.0" \
IS_SSL="" \
SSL_CERTIFICATE_FILE="" \
SSL_KEY_FILE="" \
SESSION_COOKIE_SECURE="" \
CSRF_COOKIE_SECURE=""

# Expose the (default) port
EXPOSE 8000

# Persistant storage
VOLUME ["/omnidb-server"]
