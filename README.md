# ansible-charemma

Ansible Playbook zum Provisionieren meiner Entwicklungsumgebung auf Debian-Systemen.
Installiert Systempakete, Dev-Tools und bootstrapped die Dotfile-Verwaltung via [chezmoi](https://www.chezmoi.io/).

## Rollen

| Rolle | Beschreibung |
|-------|-------------|
| base | Systempakete (i3, tmux, vim, fzf, etc.), tmux plugin manager |
| code | Dev-Tools (docker, go, git), Git-Config, Docker-Setup |
| chezmoi | Installiert chezmoi und applied Dotfiles von [charemma/dotfiles](https://github.com/charemma/dotfiles) |
| infosec | Security-Tools (nmap, wireshark, binwalk, gnuradio) |

## Voraussetzungen

```
pip3 install -r requirements.txt
ansible-galaxy install -r requirements-ansible.yml
```

## Ausfuehren

```bash
just deploy-all       # Alle Rollen
just deploy-base      # Nur Systempakete
just deploy-code      # Dev-Tools, Docker, Git
just deploy-chezmoi   # Dotfiles via chezmoi
just deploy-infosec   # Security-Tools
```

Git-Email ueberschreiben (z.B. fuer Kundenprojekte):

```bash
just deploy-code email=me@client.org
```

## Testen

```bash
just lint             # ansible-lint
just test             # Voller Playbook-Test im Docker-Container (Debian 12)
```
