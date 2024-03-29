# ansible-charemma

Ansible plabook and roles to install my required environment and tools

## Prerequisites

```
pip3 install -r requirements.txt
ansible-galaxy install -r requirements-ansible.yml
```

## Run playbook with all roles

```
source env.sh
ansible-playbook -K -i "localhost," playbook.yml
```

## Run playbook: Overwrite default var

```
source env.sh
ansible-playbook -K -i "localhost," playbook.yml -e USER_EMAIL=$USER_EMAIL -e VPN_NET_IF=$VPN_NET_IF
```

## Run playbook with selected roles

*Only role dotfiles*
```
ansible-playbook -i "localhost," playbook.yml -t dotfiles
```
