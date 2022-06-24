# Kamailio

Provision a Kamailio server instance as part of the [SIP Media Gateway](https://github.com/Renater/SIPMediaGW) stack. All configuration files found in this role have been copied from the original [SIP Media Gateway repository](https://github.com/Renater/SIPMediaGW).


## Variables

The following variables are defined in `defaults/main.yml` and are to be overwritten:
* `sip_secret`: SIP secret shared between the Kamailio and the Gateways.
* `gateway_name_pattern`: pattern to determine the Gateway instances (their name should match `*<gateway_name_pattern>*`).

The variables defined in vars/main.yml are defining which version of Kamailio will be running after the role is used: to upgrade versions, the configuration files must also be updated.


## Example Playbook

```yaml
---
- name: Provision the Kamailio server
  hosts: all
  roles:
    - kamailio
```
