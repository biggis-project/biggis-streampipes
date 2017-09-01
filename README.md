# BigGIS-StreamPipes
StreamPipes setup used in BigGIS

- Currently, it relies on services running internally at FZI.

## Running locally in docker
You can use docker-compose directly.
However, we also provide a simple `Makefile` for convenience with the following targets:

```
$ make

Useful targets:
 - restart : restarts all containers using a fresh config dir
 - down    : stop all containers and cleanup
 - ps      : print status about running containers

```

## Initial Setup

StreamPipes starts its setup assistent on first access.
You can ignore the "Advanced Settings".

### Add Endpoints

* Go to "Install Pipeline Elements" --> "Manage Endpoints"
* remove the existing endpoints
* add instead
    * http://weatherinput:8087
    * http://restproducer:8085
    * http://dextractor:8086
    * http://sensebox-adapter:8090
    * http://sensebox-metadata-enricher:8090
    * http://pe-sources-samples:8090
    * http://pe-esper:8090
    * http://pe-sinks:8090
    * http://pe-flink-samples:8090

## Using the SSH server

The pipeline has an ssh server integrated to access the docker network for debugging.
To use it, add your username to service -> ssh-tunnel -> command.
The default value "sshtunnel" is not a command but the first user added.
Afterwards, generate a a key pair with `ssh-keygen`,
append the generated public key (id_rsa.pub) to `data/ssh-tunnel/home/$user/.ssh/authorized_keys`,
and use `ssh -i id_rsa $username@$dockerhost:8022` to login into the StreamPipes docker network.

You need root privileges to edit `authorized_keys`.
Without root privileges, you can use `docker exec -ti biggisstreampipes_ssh-tunnel_1 bash`
to open a shell in the running docker image and edit `/home/$username/.ssh/authorized_keys` there.
