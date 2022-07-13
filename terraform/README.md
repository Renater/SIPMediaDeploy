# SIPMediaDeploy - Terraform

A [Terraform](https://www.terraform.io/docs) project to deploy the SIP Media Gateway stack.


## Installation

Install Terraform using the [docs](https://learn.hashicorp.com/tutorials/terraform/install-cli), depending on your OS.


## Variables

Variables can be found in the [variables.tf](./variables.tf) file and can be overwritten by environment variables whose names respect the following: to overwrite the variable `customvar`, the environment variable must be named `TF_VAR_customvar`. The precise role of every variable is detailed in the terraform files.


## Deploy a Terraform configuration

After modifying the necessary variables, run if needed:

```bash
terraform init
```

And then:

```bash
terraform plan
terraform apply
```
