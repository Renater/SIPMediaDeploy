# Coturn

This role allows us to provision a bare-minimum Coturn server.

## Variables

The variables used in the role are ones used in the Coturn configuration. These variables are defined in defaults/main.yml:

- external_ip
- domain_name
- user
- password

## Example Playbook

To use this role in a playbook you can add

```yaml
- hosts: all
  roles:
    - coturn
```
