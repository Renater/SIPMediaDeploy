# SIPMediaDeploy

This repository hosts all scripts that permit to deploy from scratch the entire SIP Media Gateway stack! It is divided in three parts:
* the [ansible](./ansible/) directory, that uses [Ansible](https://docs.ansible.com/ansible/latest/index.html) for the provisioning of the virtual machines.
* the [packer](./packer/) directory, that uses [Packer](https://www.packer.io/docs) to build VM images.
* the [terraform](./terraform/) directory, that uses [Terraform](https://www.terraform.io/docs) to deploy the stack on several cloud providers and configures it with [Cloud-Init](https://cloudinit.readthedocs.io/en/latest/index.html).

This repository does not contain the code of the SIP Media Gateway, it is based on the [SIPMediaGateway repository](https://github.com/Renater/SIPMediaGW).


## Configuration

All of the configuration is located in the [env.d](./env.d/) directory.


## Installation

Each part of the repository relies on packages and dependencies; to install them, follow the installation guidelines detailed in the READMEs and install dependencies with the following command:

```bash
make install
```


## Deploy the stack

To deploy the stack, you must first build the VM images:

```bash
make build
```

Then, you may deploy the stack:

```bash
make deploy
```


## Licensing

Apache License Version 2.0.

See [LICENSE](./LICENSE) to see the full text.
