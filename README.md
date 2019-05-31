# docker-cronicle
Docker container for a Cronicle single-server master node with python3, pip and requests module.

Works on docker swarm

Access to docker running on host

## Install
You have to build on your machine:
```
docker build -t cronicle .
```

Or just pull from Docker hub

```
docker pull iwalucas/docker-cronicle
```

## Run

```
docker run -p 3012:3012 -v /home/user/cronicle/data:/opt/cronicle/data -v /home/user/cronicle/logs:/opt/cronicle/logs -v /home/user/cronicle/plugins:/opt/cronicle/plugins -v /var/run/docker.sock:/var/run/docker.sock iwalucas/docker-cronicle
```
