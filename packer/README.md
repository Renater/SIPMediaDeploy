# SIPMediaDeploy - Packer

A [Packer](https://www.packer.io/docs) project to build the virtual machine images of the SIP Media Gateway stack.


## Installation

Install Packer using [this tutorial](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli).


## Configuration

The credentials that allows Packer to connect to the Openstack cluster should be passed as environment variables:
* `OS_AUTH_URL`: URL of the Openstack endpoint.
* `OS_USERNAME`: name of the Openstack user.
* `OS_PASSWORD`: password of the Openstack user.
* `OS_REGION_NAME`: name of the Openstack region.
* `OS_PROJECT_DOMAIN_ID`: ID of the Openstack project domain.
* `OS_USER_DOMAIN_NAME`: name of the Openstack project domain.
* `OS_PROJECT_ID`: ID of the Openstack project.
* `OS_PROJECT_NAME`: name of the Openstack project.
* `OS_INTERFACE`: Openstack interface.
* `OS_IDENTITY_API_VERSION`: version of the Openstack API.

For each service among `GW_HOST`, `KAMAILIO`, `COTURN` and `SCALER`, four environment variables should be declared in order to configure the build of the VM image:
* `PKR_VAR_<service>_SOURCE`: name of the base OS image.
* `PKR_VAR_<service>_FLAVOR`: name of the flavor.
* `PKR_VAR_<service>_NETWORK_ID`: ID of the network (this information can be found either using the Openstack command line or directly from the dashboard).
* `PKR_VAR_<service>_SSH_USERNAME`: name of the user for the SSH connection.


## Launch a packer build

In order to build all images, launch the following command:

```bash
packer build .
```

In order to build the image of a service defined in a `<service>.pkr.hcl` file, launch the following command:

```bash
packer build <service>.pkr.hcl
```
