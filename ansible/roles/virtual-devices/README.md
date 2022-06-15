# Virtual Devices

Configure audio and video virtual devices on host. Note that this role installs a new kernel version to have extra linux packages that help configuring virtual devices.


## Variables

The variables defined in `defaults/main.yml` are to be overwritten if you only want audio or video devices to be configured on host.


## Example Playbook

```yaml
---
- name: Configure virtual devices
  hosts: all
  roles:
    - virtual-devices
```
