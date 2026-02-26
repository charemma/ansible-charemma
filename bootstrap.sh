#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing Nix"
if ! command -v nix &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
    echo "Nix installed. Restart your shell and run this script again."
    exit 0
fi

echo "==> Running playbook via nix"
nix develop --command ansible-playbook -K -i "localhost," playbook.yml
