#!/bin/bash
# This script will update required tools
echo -e "Installing updates. Please wait..."
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical
apt-get -qq -y update && \
apt-get dist-upgrade -qq -y --no-install-recommends -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" && \
apt-get -y -qq -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" autoremove && \
unset DEBIAN_FRONTEND && \
unset DEBIAN_PRIORITY && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
exit 0
