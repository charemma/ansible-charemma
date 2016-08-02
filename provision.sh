#!/bin/bash

test -d env || ./bootstrap-ctrlmachine.sh
env/bin/ansible-playbook -i hosts site.yml
