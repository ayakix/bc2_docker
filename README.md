Dockerfile for building bc2 environment
=====================================

## How to use
```
docker run -i -t ayakix/ubuntu-bc2 /bin/bash
```

Only pull
```
docker pull ayakix/ubuntu-bc2
```

## Links
* [Official manual](https://bc-2.jp/sde.html)

* [Official repository](https://github.com/dgarage/bc2)

* [Docker hub for ayakix/ubuntu-bc2](https://hub.docker.com/r/ayakix/ubuntu-bc2/)

## Install from Dockerfile
```
$ docker pull ubuntu:16.10
$ docker build -t ubuntu-bc2 .
$ docker run -i -t ubuntu-bc2 /bin/bash
```

## Environments
Base OS: ubuntu 16.10
