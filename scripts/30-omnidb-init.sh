#!/bin/bash
if [[ ! -f /omnidb-server/config.py ]]; then
  python3 /opt/omnidb/OmniDB/omnidb-server.py --homedir=/omnidb-server --init
fi
