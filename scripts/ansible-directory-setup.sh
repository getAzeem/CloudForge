#!/bin/bash

ROOT=~/Documents/project/ansible

echo "Setting up CloudForge Ansible Structure..."

cd $ROOT || exit

# Core files
touch ansible.cfg
touch requirements.yml
touch README.md

# Inventories
mkdir -p inventories/production/group_vars

touch inventories/production/hosts.ini
touch inventories/production/group_vars/all.yml
touch inventories/production/group_vars/master.yml
touch inventories/production/group_vars/workers.yml
touch inventories/production/group_vars/kubectl.yml

# Playbooks
mkdir -p playbooks

touch playbooks/site.yml
touch playbooks/common.yml
touch playbooks/master.yml
touch playbooks/workers.yml
touch playbooks/kubectl.yml
touch playbooks/verify.yml

# Roles

mkdir -p roles/common/tasks
mkdir -p roles/common/handlers
mkdir -p roles/common/defaults

touch roles/common/tasks/main.yml
touch roles/common/handlers/main.yml
touch roles/common/defaults/main.yml


mkdir -p roles/containerd/tasks
mkdir -p roles/containerd/defaults

touch roles/containerd/tasks/main.yml
touch roles/containerd/defaults/main.yml


mkdir -p roles/kubeadm/tasks
mkdir -p roles/kubeadm/defaults

touch roles/kubeadm/tasks/main.yml
touch roles/kubeadm/defaults/main.yml


mkdir -p roles/master/tasks
mkdir -p roles/master/handlers

touch roles/master/tasks/main.yml
touch roles/master/tasks/init.yml
touch roles/master/tasks/calico.yml
touch roles/master/tasks/nginx.yml
touch roles/master/handlers/main.yml


mkdir -p roles/workers/tasks

touch roles/workers/tasks/main.yml
touch roles/workers/tasks/join.yml


mkdir -p roles/kubectl/tasks

touch roles/kubectl/tasks/main.yml
touch roles/kubectl/tasks/kubeconfig.yml


mkdir -p roles/verify/tasks

touch roles/verify/tasks/main.yml


# Scripts folder
mkdir -p scripts

touch scripts/generate_inventory.py


echo ""
echo "✅ Structure created inside existing ansible folder"
echo ""

tree $ROOT
