ansible/env:
	virtualenv ansible/env

env.d/terraform:
	cp env.d/terraform.dist env.d/terraform

.PHONY: install-ansible
install-ansible: ansible/env
	ansible/env/bin/pip3 install -r ansible/requirements.txt
	cd ansible/ && env/bin/ansible-galaxy install -r requirements.yml
