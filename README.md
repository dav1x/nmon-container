# nmon-container

Use containerized nmon in order to collect performance data then create an nmon chart based on that data.

- Build
```
git clone git@github.com:dav1x/nmon-container.git
cd nmon-container
podman build . -t nmon
```

```
podman run --rm -d -v /:/rootfs:ro -v /tmp/nmon_output:/opt/nmon/output --name="nmon-host-collector" --pid=host -e c=60 --privileged --net=host quay.io/dphillip/nmon-container
```
