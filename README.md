# SIPMediaDeploy

This repository hosts all scripts that permit to deploy from scratch the entire SIP Media Gateway stack! It is divided in three parts:
* the [ansible](./ansible/) directory, that uses [Ansible](https://docs.ansible.com/ansible/latest/index.html) for the provisioning of the virtual machines.
* the [packer](./packer/) directory, that uses [Packer](https://www.packer.io/docs) to build VM images.
* the [terraform](./terraform/) directory, that uses [Terraform](https://www.terraform.io/docs) to deploy the stack on several cloud providers.

This repository does not contain the code of the SIP Media Gateway, it is based on the [SIPMediaGateway repository](https://github.com/Renater/SIPMediaGW).


# Configuration

All of the configuration is located in the [env.d](./env.d/) directory.


# Licensing

Apache License Version 2.0.

See [LICENSE](./LICENSE) to see the full text.
