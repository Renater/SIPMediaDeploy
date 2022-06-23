# Kamailio

Provision a Kamailio server instance as part of the [SIP Media Gateway](https://github.com/Renater/SIPMediaGW) stack. All configuration files found in this role have been copied from the original [SIP Media Gateway repository](https://github.com/Renater/SIPMediaGW).


## Variables

The `sip_secret` variable defined in `defaults/main.yml` is to be overwritten by a real value.

The variables defined in vars/main.yml are defining which version of Kamailio will be running after the role is used: to upgrade versions, the configuration files must also be updated.


## Example Playbook

```yaml
---
- name: Provision the Kamailio server
  hosts: all
  roles:
    - kamailio
```
