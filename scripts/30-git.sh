#!/bin/bash
git clone -q https://github.com/OmniDB/OmniDB.git /opt/omnidb && \
cd /opt/omnidb && \
pip3 install -r requirements.txt
