#!/bin/bash
# This script will configure the Python environment to build OmniDB from source.
echo -e "Setting up Python."
# Make sure Python3.9 is the default
# These are probably already set correctly from the initial build,
# but just in case they were overwritten we'll do it again.
if [[ -f /usr/bin/python ]]; then
  rm /usr/bin/python
fi
if [[ -f /usr/bin/python3 ]]; then
  rm /usr/bin/python3
fi
if [[ -f /usr/bin/pydoc ]]; then
  rm /usr/bin/pydoc
fi
if [[ -f  /usr/bin/idle ]]; then
  rm  /usr/bin/idle
fi
if [[ -f  /usr/bin/idle3 ]]; then
  rm  /usr/bin/idle3
fi
if [[ -f /usr/bin/pip3 ]]; then
  rm /usr/bin/pip3
fi
if [[ -f /usr/bin/pip ]]; then
  rm /usr/bin/pip
fi
ln -s /usr/bin/idle-python3.9 /usr/bin/idle &&	\
ln -s /usr/bin/idle-python3.9 /usr/bin/idle3 && \
ln -s /usr/bin/pydoc3.9 /usr/bin/pydoc && \
ln -s /usr/bin/python3.9 /usr/bin/python && \
ln -s /usr/bin/python3.9 /usr/bin/python3
echo -e "Getting latest pip..." && \
curl -q https://bootstrap.pypa.io/get-pip.py | python && \
echo -e "Updating requirements..." && \
( cd /opt/omnidb/ && \
pip install -U setuptools wheel && \
pip install -U -r requirements.txt )
exit 0
