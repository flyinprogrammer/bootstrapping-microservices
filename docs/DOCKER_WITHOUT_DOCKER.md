# RIP Docker Desktop

For folks looking to get started with Docker these days they
should look at [Rancher Desktop](https://rancherdesktop.io/).

Rancher Desktop these days uses [Lima](https://github.com/lima-vm/lima)
under the hood, and [colima](https://github.com/abiosoft/colima) is an
alternative solution that wraps Lima.

All of these projects have READMEs and installation guides. Hopefully
someone will eventually compile a better site to host a lot of these
alternatives.

Here's the colima configuration I use:

```yaml
vm:
    cpu: 2
    disk: 60
    memory: 8
    arch: ""
    forward_agent: false
    mounts: []
runtime: docker
kubernetes:
    enabled: false
    version: v1.22.2
port_interface: ""
```

The biggest change is ensuring the runtime is `docker` and not `containerd`.
If you use `containerd` you'll need  to use `nerdctl` instead of `docker` for build scripts.
