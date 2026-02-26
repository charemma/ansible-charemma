default:
    @just --list

# Alle Rollen ausfuehren
deploy-all: deploy-base deploy-code deploy-chezmoi deploy-infosec

# Nur Systempakete und Grundsetup
deploy-base:
    ansible-playbook -K -i "localhost," playbook.yml -t base

# Dev-Tools, Docker, Git-Config (email ueberschreibbar: just deploy-code email=foo@bar.de)
deploy-code email='':
    ansible-playbook -K -i "localhost," playbook.yml -t code \
        {{ if email != "" { "-e USER_EMAIL=" + email } else { "" } }}

# chezmoi installieren und Dotfiles applyen
deploy-chezmoi:
    ansible-playbook -i "localhost," playbook.yml -t chezmoi

# Security-Tools installieren
deploy-infosec:
    ansible-playbook -K -i "localhost," playbook.yml -t infosec

# ansible-lint ausfuehren
lint:
    ansible-lint playbook.yml

# Voller Playbook-Test im Docker-Container
test *args='':
    docker build -t ansible-charemma -f tests/Dockerfile . --build-arg ANSIBLE_EXTRA_ARGS="{{ args }}"
