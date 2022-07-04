# Status-checker

This role allows us to provision a webserver that provides a status check for a given service.

## Variables

The variables defined in `defaults/main.yml` can be overwritten by real values:
* `webserver_user`: the user used to set up the webserver.
* `webserver_directory`: the working directory for the webserver.
* `service_name`: the service on which the status check is to be performed.

The variables defined in `vars/main.yml` are defining a few package versions.

## Example Playbook

To use this role in a playbook you can add

```yaml
- hosts: all
  vars:
    service_name: ssh
  roles:
    - status-checker
```
