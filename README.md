# snis-builder
[![CI](https://concourse-ci.17xf.de/api/v1/teams/main/pipelines/snis-builder-public/badge)](https://concourse-ci.17xf.de/teams/main/pipelines/snis-builder-public)

TL;DR: Build SNIS with a container.

[Space Nerds in Space](https://smcameron.github.io/space-nerds-in-space/) is an awesome starship bridge simulator developed by [smcameron](https://github.com/smcameron/). Provided you manage to build and install it, you and some friends can embark on some intriguing space adventures.
This project provides you with a container for building SNIS.
It is part of a bigger venture to create bootable USB flash drives with SNIS installed on. Who doesn't want to have SNIS in their pocket at all times?

## Quickstart
### get sources and build container
``` 
git clone https://github.com/fgerling/snis-builder.git
cd snis-builder
podman build -t $USER/snisbuilder .
```

### build SNIS in container
```
podman run -ti --rm --userns=keep-id -v $PWD/data:/app $USER/snisbuilder:latest
```

## Background - fasted way into space is through the sky

The final goal is to get a bootable USB image with a minimalistic OS and SNIS on it. Boot it and take off to space.
It's still space _nerds_ in space. So the creation of that USB image should be automated and be done for every commit. Ideally, we test it along the way and are independent of specific Linux distributions. The fasted way into space is through the sky, so a cloud-based CI system was an obvious choice. 

snis-builder can be used within a CI system or as a "standalone" container. 

### Technical
The container itself is based on Ubuntu with the [build dependencies](https://smcameron.github.io/space-nerds-in-space/#buildinstructions) for SNIS installed.
Upon running the container, it will clone the [SNIS repository](https://github.com/smcameron/space-nerds-in-space) if not already present and start building SNIS.

Check the `Dockerfile` to see what dependencies are installed and check `entrypoint.sh` to learn how the container is building SNIS. 
