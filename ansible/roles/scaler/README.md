# Scaler

Provision a Virtual Machine Scaler instance, whose code is available on [the SimpleScaleVM Github repository](https://github.com/Renater/SimpleScaleVM).


## Requirements

The following requirements must be met in order for this role to work properly:
* a `scaler` user who has access to the `/var/scaler` directory must be present on the server.
* Docker, Docker-compose and the Docker pip package must be installed on host, and the `scaler` user should have access to Docker (the easiest way to meet this requirement is to apply the `geerlingguy.docker` role and install the Docker pip package).


## Variables

The following variables are defined in `defaults/main.yml` and may be overwritten to configure the Scaler (especially the provider configuration):
* `scaler_image_name`: name of the Docker Scaler image.
* `scaler_version`: version of the Docker Scaler image.
* `scaler_http_host`: host of the HTTP server.
* `scaler_http_port`: port of the HTTP server.
* `scaler_provider`: provider for the scaler (only available value is `openstack`).
* `scaler_provider_configuration`: configuration of the provider; each provider has its own configuration which is defined in the subsections below.

The variables defined in `vars/main.yml` are defining global constants.

### Openstack provider configuration

The following keys of the `scaler_provider_configuration` may be overwritten to configure the Openstack Scaler provider:
* `auth_url`: URL of the Openstack endpoint.
* `username`: name of the Openstack user.
* `password`: password of the Openstack user.
* `region_name`: name of the Openstack region.
* `project_domain_id`: ID of the Openstack project domain.
* `user_domain_name`: name of the Openstack project domain.
* `project_id`: ID of the Openstack project.
* `project_name`: name of the Openstack project.
* `interface`: Openstack interface.
* `identity_api_version`: version of the Openstack API.
* `flavor`: name of the flavor to use for the virtual machines.
* `image`: name of the image to use for the virtual machines.
* `ip_version`: IP version to use for virtual machines.
* `network`: name of the network to use for the virtual machines.
* `metadata_key`: metadata key to identify the scaled server pool.
* `metadata_value`: metadata value to identify the scaled server pool.
* `keypair`: name of the keypair that is provisioned on the virtual machines.
* `cloud_init_file`: path to the cloud-init file that is used as user-data on the virtual machines.


## Example Playbook

```yaml
---
- name: Deploy the Virtual Scaler
  hosts: all
  roles:
    - scaler
```
