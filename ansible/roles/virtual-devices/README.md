# Virtual Devices

Configure audio and video virtual devices on host. Note that this role installs a new kernel version to have extra linux packages that help configuring virtual devices.


## Variables

The variables defined in `defaults/main.yml` are to be overwritten:
* if you only want audio or video devices to be configured on host, you can modify the values of `configure_audio_virtual_devices` and `configure_video_virtual_devices`.
* if you want to configure a specific number of virtual devices, you can modify the values of `audio_virtual_devices` and `video_virtual_devices` (note that it should be less than or equal to 8).


## Example Playbook

```yaml
---
- name: Configure virtual devices
  hosts: all
  roles:
    - virtual-devices
```
