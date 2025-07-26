#!/bin/bash

set -e

REPO_URL="https://github.com/your-username/your-ansible-repo.git"
CLONE_DIR="$HOME/ansible-local-setup"

# Step 1: Install Ansible if not installed
if ! command -v ansible &> /dev/null; then
    echo "[+] Installing Ansible..."
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
else
    echo "[+] Ansible already installed."
fi

# Step 2: Clone the repo
echo "[+] Cloning Ansible repo..."
rm -rf "$CLONE_DIR"
git clone "$REPO_URL" "$CLONE_DIR"

# Step 3: Run the playbook
echo "[+] Running Ansible playbook locally..."
cd "$CLONE_DIR"
ansible-playbook install_packages.yml

echo "[+] Setup complete."
