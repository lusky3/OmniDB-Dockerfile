#!/bin/bash
if [[ -f /omnidb-server/config.lock ]]; then
  echo -e "config.lock found in /omnidb-server. Skipping ENV setup."
  echo -e "(Remove config.lock if you would like to update config.conf)"
  exit 0
else
  echo -e "Modifying config.conf with ENV values..."
  echo -e "(Tip: Add empty file config.lock to /omnidb-server to prevent overwriting settings)"
  cd /omnidb-server
  if [[ ! -z $LISTENING_PORT ]]; then
    sed -i "s/^listening_port[[:blank:]]*=.*$/listening_port       = ${LISTENING_PORT}/g" config.conf
  fi
  if [[ ! -z $WEBSOCKET_PORT ]]; then
    sed -i "s/^websocket_port[[:blank:]]*=.*$/websocket_port       = ${WEBSOCKET_PORT}/g" config.conf
  fi
  if [[ ! -z $LISTENING_ADDRESS ]]; then
    sed -i "s/^listening_address[[:blank:]]*= .*$/listening_address    = '${LISTENING_ADDRESS}'/g" config.conf
  fi
  if [[ $IS_SSL == "true" ]] || [[ $IS_SSL == "True" ]] || [[ $IS_SSL == "Yes" ]] || [[ $IS_SSL == "yes" ]]; then
    sed -i "s/^is_ssl[[:blank:]]*=.*$/is_ssl               = True/g" config.conf
  else
    sed -i "s/^is_ssl[[:blank:]]*=.*$/is_ssl               = False/g" config.conf
  fi
  if [[ ! -z $SSL_CERTIFICATE_FILE ]]; then
    sed -i "s/^ssl_certificate_file[[:blank:]]*= .*$/ssl_certificate_file = '${SSL_CERTIFICATE_FILE}'/g" config.conf
  fi
  if [[ ! -z $SSL_KEY_FILE ]]; then
    sed -i "s/^ssl_key_file[[:blank:]]*= .*$/ssl_key_file         = '${SSL_KEY_FILE}'/g" config.conf
  fi
  if [[ ! -z $CSRF_TRUSTED_ORIGINS ]]; then
    sed -i "s/^csrf_trusted_origins[[:blank:]]*= .*$/csrf_trusted_origins = '${CSRF_TRUSTED_ORIGINS}'/g" config.conf
  fi
fi
exit 0
