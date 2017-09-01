# BigGIS-StreamPipes
StreamPipes setup used in BigGIS

- Currently, it relies on services running internally at FZI.

# Running locally in docker
You can use docker-compose directly.
However, we provide a `Makefile` simple for convenience with the following targets:

```
$ make

Useful targets:
 - restart : restarts all containers using a fresh config dir
 - down    : stop all containers and cleanup
 - ps      : print status about running containers

```

# Initial Setup

StreamPipes starts its setup assistent on first access.
You can ignore the "Advanced Settings".

## Add Endpoints

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
