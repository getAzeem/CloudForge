# CloudForge Ansible Project

This repository contains an Ansible project that provision a production-style Kubernetes
cluster on AWS EC2 instances using `kubeadm`.

## Workflow

1. Terraform is executed first to bring up EC2 infrastructure.
2. The pipeline runs `terraform output -json > tf-output.json`.
3. `python scripts/generate_inventory.py` creates
   `ansible/inventories/production/hosts.ini` from Terraform output.
4. Ansible runs `ansible-playbook playbooks/site.yml` to bootstrap the cluster.

Everything is designed to run non‑interactively in a Jenkins pipeline.  All tasks are
idempotent so the playbooks may be re‑run safely.

## Directory Layout

The directory tree is pre‑populated; files are filled with complete contents and no new
paths are created by the playbooks.  See the project description in the root of the
workspace for additional details.

## Prerequisites

* Ubuntu 22.04 nodes with SSH access as user `ubuntu`.
* SSH key already configured for `ubuntu`.
* Python 3 and Ansible installed on the controller (Jenkins agent).

## Generating Inventory

```sh
terraform apply …
terraform output -json > tf-output.json
python scripts/generate_inventory.py
```

## Executing Playbooks

```sh
ansible-playbook -i inventories/production/hosts.ini playbooks/site.yml
```

The `verify` playbook will fail if the Kubernetes API does not return expected output.
