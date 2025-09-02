# gonoph-ee-aws

Execution Environment for Image Builder POC

## Overview

In the `gonoph-ee-aws` directory, is a `Makefile` for creating the Execution Environment that will perform all the needed functions for this POC.

It will ensure the following are installed into the environment:

1. Packages:
    1. `qemu-img`
    2. `findutils`
2. pip modules:
    1. `boto`
    2. `boto3`
    3. `awscli`
3. Ansible Collections (from Automation Hub when available)
    1. `ansible.posix`
    2. `amazon.aws`
    3. `redhat.rhel_system_roles`
    4. `redhat.insights`
    5. `community.general`
    6. `community.libvirt`

### Customize Registry

If you have your own docker / quay registry, then you can update this:

```bash
cd gonoph-ee-aws
MYREG=myquay.reg.example.com
podman login $MYREG
sed -i "s%localhost:5000%$MYREG%" Makefile
```

If you DO NOT have your own docker / quary registry, then you can fake it **(FOR TESTING PURPOSES ONLY)** with this service unit.

You probably want to mount a real filesystem at `/mnt/registry`

```bash
sudo mkdir -p /mnt/registry
sudo chown 806465075:806465075 /mnt/registry
sudo make service
```

This will copy the tower-registry.service unit and create a docker-registry container which will store images at that mount point.

### Customize ansible.cfg

```bash
make ansible.cfg
```

Then you can edit ansible.cfg.

```ini
[defaults]
remote_user = ansible

[privilege_escalation]
become_method = sudo
become_user = root

[galaxy]
server_list = automation_hub, community

[galaxy_server.community]
url=https://galaxy.ansible.com/

[galaxy_server.automation_hub]
url=https://cloud.redhat.com/api/automation-hub/
auth_url=https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/token

token=Update1111This111Token
```

You can create a offline token for [Automation Hub here][token].

Update the following line:

[token]: https://console.redhat.com/ansible/automation-hub/token/

```
token=Update1111This111Token
```

### Create the EE

Create the EE by running make.

```bash
make
```

Push it to the registry (replace `localhost:5000` - with your registry location):

```bash
podman push localhost:5000/ansible/gonoph-ee-aws:latest
```
