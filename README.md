# setup

Provisioning my development environment on Debian systems. Uses Ansible for system packages and dev tools, [chezmoi](https://www.chezmoi.io/) for dotfiles, and [Nix](https://nixos.org/) for reproducible dev dependencies.

## Bootstrap (fresh machine)

```bash
./bootstrap.sh
```

Installs Nix and runs the full playbook.

## Roles

| Role | Description |
|------|-------------|
| base | System packages (i3, tmux, vim, fzf, etc.), tmux plugin manager |
| code | Dev tools (docker, go, git), git config, docker setup |
| chezmoi | Installs chezmoi and applies dotfiles from [charemma/dotfiles](https://github.com/charemma/dotfiles) |
| infosec | Security tools (nmap, wireshark, binwalk, gnuradio) |

## Usage

Activate the dev shell (or use [direnv](https://direnv.net/) for automatic activation):

```bash
nix develop
```

Then run the playbook:

```bash
ansible-playbook -K playbook.yml              # All roles
ansible-playbook -K playbook.yml -t base      # System packages only
ansible-playbook -K playbook.yml -t code      # Dev tools, docker, git
ansible-playbook playbook.yml -t chezmoi      # Dotfiles via chezmoi
ansible-playbook -K playbook.yml -t infosec   # Security tools
```

Override git email (e.g. for client projects):

```bash
ansible-playbook -K playbook.yml -t code -e code_user_email=me@client.org
```
