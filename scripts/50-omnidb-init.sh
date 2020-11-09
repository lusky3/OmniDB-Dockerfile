#!/bin/bash
if [[ ! -f /omnidb-server/config.py ]]; then
  echo -e "Initializing OmniDB home folder..."
  python3 /opt/omnidb/OmniDB/omnidb-server.py --homedir=/omnidb-server --init
else
  echo -e "config.py was found at /omnidb-server. Skipping initialization."
  echo -e "(If you want to force initialization, please remove config.py)"
fi
exit 0
