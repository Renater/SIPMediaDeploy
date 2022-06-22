# Gateway Launcher

Provision a SIP Media Gateway Launcher instance as part of the [SIP Media Gateway](https://github.com/Renater/SIPMediaGW) stack. All configuration files found in this role have been copied from the original [SIP Media Gateway repository](https://github.com/Renater/SIPMediaGW).


## Requirements

The following requirements must be met in order for this role to work properly:
* a `gateway` user who has access to the `/var/launcher` directory must be present on the server.
* Docker, Docker-compose and the Docker pip package must be installed on host, and the `gateway` user should have access to Docker (the easiest way to meet this requirement is to apply the `geerlingguy.docker` role and install the Docker pip package).
* audio and video virtual devices must be configured on host (the easiest way to meet this requirement is to apply the `virtual-devices` role).


## Variables

The variables defined in `defaults/main.yml` are to be overwritten by real values fetched from other instances (e.g. Coturn, Kamailio) in the stack using Cloud-init. Note that by default, Gateways are started at execution but this behaviour can be modified by overwriting the value of `start_gateways_at_execution`.

The variables defined in `vars/main.yml` are defining global constants and a few package versions: to upgrade the corresponding packages, the configuration files must also be updated.


## Example Playbook

```yaml
---
- name: Configure the SIP Media Gateway Launcher
  hosts: all
  roles:
    - gateway-launcher
```
