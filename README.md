# OmniDB-Dockerfile
OmniDB as a self-building docker container.

### Why?
OmniDB maintains their own [dockerfile](https://hub.docker.com/r/omnidbteam/omnidb), but only for 3b releases <i>(at the time of writing)</i> and the only [recently updated](https://github.com/taivokasper/docker-omnidb) <i>(again, at time of writing)</i> only has 2.7.  
  
This repo will contain 2.7.x stable and a self-building 3.x bleeding edge.
  
This is a very niche build created for my own use. I'd generally recommend using the [OmniDB version](https://hub.docker.com/r/omnidbteam/omnidb).

### Tags
<code>2</code>, <code>2.17.0</code>, <code>stable</code>  
<code>3</code>, <code>latest</code>

### ENV

| Environment Variable | Default |
| ---- | ----- |
| LISTENING_PORT | 8080  |
| LISTENING_ADDRESS | 127.0.0.1 |
| IS_SSL | false |
| SSL_CERTIFICATE_FILE | unset |
| SSL_KEY_FILE | unset |
| SESSION_COOKIE_SECURE | unset |
| CSRF_COOKIE_SECURE | unset |

### Ports
| Port | Usage |
| ---- | ----- |
| 8080 | HTTP  |
| 25482 | Websocket |  
  
If you change the HTTP port from the default (8080) make sure to change the docker exposed port.

### Login
Default login username: "admin" and password "admin".

#### Documentation
See OmniDB [Read the Docs](https://omnidb.readthedocs.io/en/latest/).

### Dockerhub
Available on [Docker Hub](https://hub.docker.com/repository/docker/lusky3/omnidb).
