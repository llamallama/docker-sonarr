# Nzbget Dockerfile

This is a dockerised version of Sonarr. 

## Usage

The container has three volumes, one for configuration,
one for incoming (downloaded) files, and one for output.

Create named volumes for the config:

```bash
docker volume create --name sonarr-config
```

Start a container, exposing the UI port, and binding all the
volumes: 

```bash
docker run -d --name sonarr \
              --restart always \
              -v sonarr-config:/config \
              -v /mnt/external/downloads:/downloads \
              -v /mnt/external/tv:/destination \
              -p 8989:8989 \
              llamallama/sonarr
```

