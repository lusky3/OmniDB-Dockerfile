# OmniDB-Dockerfile
[OmniDB](https://omnidb.org/) as a self-building docker container.

### Why?
OmniDB maintains their own [dockerfile](https://hub.docker.com/r/omnidbteam/omnidb), but only for 3b releases _(at the time of writing)_ and the only [recently updated](https://github.com/taivokasper/docker-omnidb) _(again, at time of writing)_ only has 2.17.  
  
This repo will contain 2.17.x stable and a self-building 3.x bleeding edge. 2.17.0 is pre-build docker hub image whereas 3.x is built on-the-fly using the latest [omnidb:master](https://github.com/OmniDB/OmniDB) pull.
  
This is a very niche build created for my own use. I'd generally recommend using the [OmniDB version](https://hub.docker.com/r/omnidbteam/omnidb) over this one.

### Tags
`2`, `2.17.0`, `stable`  
`3`, `latest`

### Recommended Settings
```
docker run -d \
  --name OmniDB \
  --hostname omnidb \
  --restart unless-stopped \
  -v "/opt/appdata/omnidb:/omnidb-server" \
  lusky3/omnidb:latest
```
  
Then use a reverse proxy like [Traefik](https://github.com/traefik/traefik) or [SWAG](https://github.com/linuxserver/docker-swag) to securly connect via your domain (maybe `omnidb.mydomain.com`?).

### ENV

| Environment Variable | Default | Options |
| ---- | ----- | ---- |
| LISTENING_PORT | 8000  | `0 - 65535` |
| LISTENING_ADDRESS | 0.0.0.0 | `x.x.x.x` or `example.com` |
| IS_SSL | False | `True` or `False` |
| SSL_CERTIFICATE_FILE | unset | Path eg. `/omnidb-server/cert.pem` |
| SSL_KEY_FILE | unset | Path eg. `/omnidb-server/cert.key` |
| SESSION_COOKIE_SECURE | False (unset) | `True` or `False` |
| CSRF_COOKIE_SECURE | False (unset) | `True` or `False` |  
  
**Tip:** For 3.x, you can create a `config.lock` file in `/omnidb-server` to prevent your configuration from being overwritten by these variables.

### Volumes
`/omnidb-server` is mapped by default and stores the config/database/etc.  
Use something like `-v /my/path:/omnidb-server` to expose the dir to your host, if desired.

### Ports
| Port | Usage |
| ---- | ----- |
| 8000 | HTTP  |
| 25482 | Websocket* |  
  
_\* Only applicable for 2.17.0_  
  
If you change the HTTP port from the default (8000) make sure to change the docker exposed port.


### Login
Default login username: "admin" and password "admin".

#### Documentation
See OmniDB [Read the Docs](https://omnidb.readthedocs.io/en/latest/).

### Docker Hub
Available on [Docker Hub](https://hub.docker.com/repository/docker/lusky3/omnidb).
