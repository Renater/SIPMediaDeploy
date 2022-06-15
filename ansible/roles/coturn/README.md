# Coturn

This role allows us to provision a bare-minimum Coturn server.

## Variables

The variables used in the role are ones used in the Coturn configuration. These variables are defined in defaults/main.yml:
- `coturn_port` : the port on which the Coturn server will listen.
- `external_ip` : external IP address of the Coturn server.
- `domain_name` : domain name of the provider of the Coturn server.
- `user`        : username used for the connection.
- `password`    : password used  for the connection.

## Example Playbook

To use this role in a playbook you can add

```yaml
- hosts: all
  roles:
    - coturn
```
