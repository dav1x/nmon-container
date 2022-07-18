# nmon-container

Use containerized nmon in order to collect performance data.

- Build
```
git clone git@github.com:dav1x/nmon-container.git
cd nmon-container
podman build . -t nmon
```

Run directly from quay image:
```
podman run -it -–privileged --pid=host --network=host -v=/tmp:/tmp:rw -t quay.io/dphillip/nmon-container:latest nmon -f /tmp/ -s1 -c 180 -t 
# every second for 180 seconds

podman run -it -–privileged --pid=host --network=host -v=/tmp:/tmp:rw -t quay.io/dphillip/nmon-container nmonchart /tmp/deployhost_220706_0155.nmon
``
