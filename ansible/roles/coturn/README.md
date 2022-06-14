# Coturn

This role allow us to provision a bare-minimum Coturn server.

## Variables

The variables used in the role are ones used in the cotuen configuration. These variables are defined in defaults/main.yml.

After setting up you ansible environment `make env.d/ansible` you should find a file `ansible` which contains the varibles used in this role:

        - external_ip
        - domain_name
        - user
        _ password

If you want to use this role independently from the whole project, this file must be placed in the correct directory and sourced before running the ansible-playbook command.

## Example Playbook

To use this role in a playbook you can add
s
```yaml
        - hosts: all
          roles:
            - coturn
```
