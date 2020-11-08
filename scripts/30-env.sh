#!/bin/bash
if [[ -f /omnidb-server/config.py ]]; then
  exit 0
else
  cd /omnidb-server
  if [[ $LISTENING_ADDRESS != "8000" ]]; then
    sed -i "s/LISTENING_ADDRESS    =  .*$/LISTENING_ADDRESS    = '${LISTENING_ADDRESS}'/g" config.py
  fi
  if [[ $IS_SSL == "true" ]] || [[ $IS_SSL == "True" ]] || [[ $IS_SSL == "Yes" ]] || [[ $IS_SSL == "yes" ]]; then
    sed -i "s/IS_SSL    = 'false'/IS_SSL    = 'true'/g" config.py
  fi
  if [[ ! -z $SSL_CERTIFICATE_FILE ]]; then
    sed -i "s/SSL_CERTIFICATE_FILE    = .*$/SSL_CERTIFICATE_FILE    = '${SSL_CERTIFICATE_FILE}'/g" config.py
  fi
  if [[ ! -z $SSL_KEY_FILE ]]; then
    sed -i "s/SSL_KEY_FILE    =  .*$/SSL_KEY_FILE    = '${SSL_KEY_FILE}'/g" config.py
  fi
  if [[ ! -z $SESSION_COOKIE_SECURE ]]; then
    sed -i "s/SESSION_COOKIE_SECURE    = .*$/SESSION_COOKIE_SECURE    = '${SESSION_COOKIE_SECURE}'/g" config.py
  fi
  if [[ ! -z $CSRF_COOKIE_SECURE ]]; then
    sed -i "s/CSRF_COOKIE_SECURE    = .*$/CSRF_COOKIE_SECURE    = '${CSRF_COOKIE_SECURE}'/g" config.py
  fi
fi
