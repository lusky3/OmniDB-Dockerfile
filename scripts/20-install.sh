#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical
apt-get -qq -y update && \
apt-get install -y -qq -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" software-properties-common && \
add-apt-repository -y -q ppa:deadsnakes/ppa && \
apt-get -qq -y update && \
apt-get install -qq -y --no-install-recommends -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" \
  autoconf \
  automake \
  bzip2 \
  ca-certificates \
  curl \
  dirmngr \
  dpkg-dev \
  file \
  g++ \
  gcc \
  gnupg \
  idle-python3.9 \
  imagemagick \
  libbz2-dev \
  libc6-dev \
  libcurl4-openssl-dev \
  libdb-dev \
  libevent-dev \
  libffi-dev \
  libgdbm-dev \
  libglib2.0-dev \
  libgmp-dev \
  libjpeg-dev \
  libkrb5-dev \
  liblzma-dev \
  libmagickcore-dev \
  libmagickwand-dev \
  libmaxminddb-dev \
  libncurses5-dev \
  libncursesw5-dev \
  libpng-dev \
  libpq-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libtool \
  libwebp-dev \
  libxml2-dev \
  libxslt-dev \
  libyaml-dev \
  make \
  mercurial \
  netbase \
  openssh-client \
  patch \
  procps \
  python3.9 \
  python3-pip \
  subversion \
  unzip \
  wget \
  xz-utils \
  zlib1g-dev
rm /usr/bin/python /usr/bin/pydoc
ln -s idle-python3.9 /usr/bin/idle &&	\
ln -s idle-python3.9 /usr/bin/idle3 && \
ln -s /usr/bin/pydoc3.9 /usr/bin/pydoc && \
ln -s /usr/bin/python3.9 /usr/bin/python
exit 0
