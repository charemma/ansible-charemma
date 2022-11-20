# ansible-charemma

Ansible plabook and roles to install my required environment and tools

## Prerequisites

```
pip3 install -r requirements.txt
ansible-galaxy install -r requirements-ansible.yml
```

## Run playbook with all roles

```
ansible-playbook -K -i "localhost," playbook.yml
```

## Run playbook with selected roles

*Only role dotfiles*
```
ansible-playbook -i "localhost," playbook.yml -t dotfiles
```