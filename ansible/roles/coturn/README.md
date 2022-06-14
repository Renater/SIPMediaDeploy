# Coturn

This role allows us to provision a bare-minimum Coturn server.

## Variables

The variables used in the role are ones used in the Coturn configuration. These variables are defined in defaults/main.yml.

After setting up you ansible environment `make env.d/ansible` you should find a file `ansible` which contains the variables used in this role:

        - external_ip
        - domain_name
        - user
        - password

If you want to use this role independently from the whole project, this file must be placed in the correct directory and sourced before running the ansible-playbook command.

## Example Playbook

To use this role in a playbook you can add

```yaml
        - hosts: all
          roles:
            - coturn
```
