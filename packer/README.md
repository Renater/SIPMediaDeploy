# SIPMediaDeploy - Packer

A [Packer](https://www.packer.io/docs) project to build virtual machine images of the SIP Media Gateway stack.

## Installation 


Install Packer using this [tutorial](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli)

## Configuration 

Environment variables are necessary for the connection to the Openstack cluster (env.d/packer).

Credentials can be downloaded from the dashboard ( you can follow this [tutorial](https://docs.openstack.org/newton/user-guide/common/cli-set-environment-variables-using-openstack-rc.html))

Other variables must be set in order to create the image : the ID of the image used , the ID of the flavor used and Id of the network.

These information can be found either using the Openstack command Line or directly from the dashboard.

In order to launch a pcker build the file containing the variables must be sourced.
## Launch a packer build 

```
packer validate .
packer build .
```




