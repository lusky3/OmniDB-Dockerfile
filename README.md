# OmniDB-Dockerfile
[OmniDB](https://omnidb.org/) as a self-building docker container.

### Why?
OmniDB maintains their own [dockerfile](https://hub.docker.com/r/omnidbteam/omnidb), but only for 3b releases _(at the time of writing)_ and the only [recently updated](https://github.com/taivokasper/docker-omnidb) _(again, at time of writing)_ only has 2.17.  
  
This repo will contain 2.17.x stable and a self-building 3.x bleeding edge. 2.17.0 is pre-build docker hub image whereas 3.x is built on-the-fly using the latest [omnidb:master](https://github.com/OmniDB/OmniDB) pull.
  
This is a very niche build created for my own use. I'd generally recommend using the [OmniDB version](https://hub.docker.com/r/omnidbteam/omnidb) over this one.

### Tags
**Version 2.x:** `2`, `2.17.0`, `stable`  
**Version 3.x:** `3`, `3.0.2b`,`beta`  
**Bleeding Edge:** `edge`,`latest`

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

| Environment Variable | Default | Options | Applicable Version |  
| ---- | ----- | ---- | ----- |
| LISTENING_PORT | 8000 | `0 - 65535` | `2.x`, `3.x` |
| WEBSOCKET_PORT | 25482 | `0 - 65535` | `2.x` |
| LISTENING_ADDRESS | 0.0.0.0 | `x.x.x.x` or `example.com` | `2.x`, `3.x` |  
| IS_SSL | False | `True` or `False` | `2.x`, `3.x` |  
| SSL_CERTIFICATE_FILE | unset | Path eg. `/omnidb-server/cert.pem` | `2.x`, `3.x` |
| SSL_KEY_FILE | unset | Path eg. `/omnidb-server/cert.key` | `2.x`, `3.x` |
| SESSION_COOKIE_SECURE | False (unset) | `True` or `False` | `3.x` |
| CSRF_COOKIE_SECURE | False (unset) | `True` or `False` | `3.x` |
| CUSTOM_PATH | unset | URL Subfolder eg. `/omnidb` | `2.x`, `3.x` |
| CSRF_TRUSTED_ORIGINS | unset | String eg. `origin1,origin2,origin3` | `2.x` |

  
If you change the HTTP or Websocket ports from the defaults (8000,25482) be sure to change the docker exposed port.
  
**Tip:** You can create a `config.lock` file in `/omnidb-server` to prevent your configuration from being overwritten by these variables.

### Volumes
`/omnidb-server` is mapped by default and stores the config/database/etc.  
Use something like `-v /my/path:/omnidb-server` to expose the dir to your host, if desired.

### Login
Default login username: "admin" and password "admin".

#### Documentation
See OmniDB [Read the Docs](https://omnidb.readthedocs.io/en/latest/).

### Docker Hub
Available on [Docker Hub](https://hub.docker.com/repository/docker/lusky3/omnidb).
