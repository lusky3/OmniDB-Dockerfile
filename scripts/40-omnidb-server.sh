#!/bin/bash
if [[ ! /omnidb-server/config.py ]]; then
  python3 /opt/omnidb/OmniDB/omnidb-server.py --homedir=/omnidb-server --init
fi
python3 /opt/omnidb/OmniDB/omnidb-server.py --homedir=/omnidb-server
echo -e "If you are reading this then something went wrong."
exit 1
