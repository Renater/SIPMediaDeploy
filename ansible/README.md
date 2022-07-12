# SIPMediaDeploy - Ansible

An [Ansible](https://docs.ansible.com/ansible/latest/index.html) project to provision virtual machine images of the SIP Media Gateway stack.


## Installation

Python [virtualenv](https://virtualenv.pypa.io/en/latest/) is used to run all Ansible commands in an isolated Python environment. To install it, launch the following command:

```bash
python3 -m pip install virtualenv
```

To setup the virtualenv, install Ansible pip packages and get the Ansible-Galaxy dependencies, launch the following commands:

```bash
virtualenv env/
env/bin/pip3 install -r requirements.txt
env/bin/ansible-galaxy install -r requirements.yml
```


## Configuration

In order to customize the provisioning of the infrastructure, you may overwrite default values directly in the inventory. Each role includes a README that precisely describes all variables.

The TLS configuration for SIP signalling is a special case as it is a general feature that affects several parts of the infrastructure. It is configurable by passing the following environment variables when launching the playbooks:
* `ENABLE_TLS`: boolean that indicates if TLS should be enabled for SIP signalling.
* `KAMAILIO_FULLCHAIN_CERTIFICATE`: the fullchain of the TLS certificate.
* `KAMAILIO_PRIVKEY_CERTIFICATE`: the private key of the TLS certificate.

Besides, the global Ansible configuration is detailed in the [ansible.cfg](./ansible.cfg) file. All configuration keys are available in [the Ansible documentation](https://docs.ansible.com/ansible/latest/reference_appendices/config.html).


## Launch a playbook

To run an Ansible playbook on a set of hosts, complete the [inventory file](./inventories/main.yml) and launch the following command:

```bash
env/bin/ansible-playbook playbooks/<your playbook>.yml [-l <list of hosts>] [--ask-pass]
```
