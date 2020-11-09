#!/bin/bash
echo -e "Updating OmniDB repository..."
cd /opt/omnidb && \
git fetch origin master --quiet && \
git reset --hard origin/master --quiet && \
git clean -fd --quiet &&
git pull --quiet
exit 0
