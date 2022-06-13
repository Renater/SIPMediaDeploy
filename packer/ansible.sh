#!/bin/bash
set -eo pipefail

cd ..
bin/ansible-playbook "$@"
