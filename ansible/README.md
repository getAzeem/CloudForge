# CloudForge – Kubernetes Cluster Automation with Ansible

CloudForge is a production-oriented DevOps automation project that provisions and configures a **kubeadm-based Kubernetes cluster on AWS EC2 instances** using **Ansible** after infrastructure is created by Terraform.

This project implements a **real production-style DevOps workflow** where infrastructure provisioning and Kubernetes configuration are completely automated and safe for CI/CD pipeline execution.

The automation is:
- Fully automated
- Idempotent
- Pipeline-safe
- Production-structured
- Terraform-integrated

---

## Overview

CloudForge uses the following workflow:

Terraform → AWS Infrastructure  
Python Script → Dynamic Inventory  
Ansible → Kubernetes Configuration  
kubeadm → Cluster Bootstrap  
Calico → Networking  
NGINX Ingress → Routing  
Proxy Server → Cluster Control  
Verification Role → Health Checks

Infrastructure is provisioned first and then Ansible configures Kubernetes automatically.

---

## Cluster Architecture

The cluster consists of 4 EC2 instances:

| Role | Description |
|------|-------------|
| Master Node | Kubernetes Control Plane |
| Worker Node 1 | Application workloads |
| Worker Node 2 | Application workloads |
| Kubectl Server | Cluster access and management |

All nodes run:
- Ubuntu 22.04 / 24.04
- containerd runtime
- kubeadm-based Kubernetes
- Calico networking

---

## Project Structure

```
ansible/
├── ansible.cfg
├── requirements.yml
├── inventories/
│   └── production/
│       ├── hosts.ini
│       └── group_vars/
│           ├── all.yml
│           ├── master.yml
│           ├── workers.yml
│           └── kubectl.yml
├── playbooks/
│   ├── site.yml
│   ├── common.yml
│   ├── master.yml
│   ├── workers.yml
│   ├── kubectl.yml
│   └── verify.yml
├── roles/
│   ├── common/
│   ├── containerd/
│   ├── kubeadm/
│   ├── master/
│   ├── workers/
│   ├── kubectl/
│   └── verify/
└── scripts/
    └── generate_inventory.py
```

---

## Automation Workflow

```
Terraform Apply
↓
Terraform Output JSON
↓
generate_inventory.py
↓
Ansible Playbook
↓
Kubernetes Cluster Ready
```

Pipeline Execution:

```bash
terraform apply
terraform output -json > tf-output.json
python scripts/generate_inventory.py
ansible-playbook playbooks/site.yml
```

---

## Features

### Infrastructure Integration
- Terraform-created infrastructure
- Dynamic inventory generation
- Automatic IP detection
- Zero manual configuration

### Node Preparation

The common role prepares all nodes by:
- Updating apt cache
- Installing required packages
- Disabling swap permanently
- Configuring kernel modules
- Applying sysctl settings

Kernel modules:
```
overlay
br_netfilter
```

Sysctl configuration:
```
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1
```

### Container Runtime

Containerd installation includes:
- Installation from Docker repository
- Default configuration generation
- SystemdCgroup enabled
- Service enabled on boot

```
SystemdCgroup = true
```

### Kubernetes Installation

Kubernetes components installed:
- kubelet
- kubeadm
- kubectl

Installed from official repository:
```
pkgs.k8s.io
```

Packages are held to prevent unintended upgrades.

### Control Plane Automation

Master node automation:
- kubeadm initialization
- API server readiness checks
- kubeconfig configuration
- Worker join command generation

Cluster initialization:
```
kubeadm init --pod-network-cidr=192.168.0.0/16
```

Initialization is idempotent and safe for repeated runs.

### Worker Node Automation

Workers automatically:
- Detect if already joined
- Join cluster using token
- Configure kubelet

Join command is dynamically retrieved from master node.

### Networking (Calico)

Calico CNI is automatically installed:
```
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.0/manifests/calico.yaml
```

Provides:
- Pod networking
- Cross-node communication
- Network policies

### Ingress Controller

NGINX Ingress Controller is automatically deployed:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/cloud/deploy.yaml
```

Provides:
- HTTP routing
- External access
- Reverse proxy

### Kubectl Proxy Server

A dedicated kubectl server is configured. This server:
- Receives kubeconfig from master node
- Stores kubeconfig in `~/.kube/config`
- Allows cluster control from a separate machine

```
kubectl get nodes
```

### Cluster Verification

Verification role performs:
```
kubectl get nodes
kubectl get pods -A
```

Ensures:
- Nodes reachable
- Cluster healthy
- API server working

Pipeline fails automatically if cluster is unhealthy.

---

## Inventory Generation

Inventory is automatically generated from Terraform outputs.

Script:
```
scripts/generate_inventory.py
```

Produces:
```
inventories/production/hosts.ini
```

Example:
```ini
[master]
44.xxx.xxx.xxx

[workers]
44.xxx.xxx.xxx
44.xxx.xxx.xxx

[kubectl]
44.xxx.xxx.xxx
```

No manual IP configuration required.

---

## SSH Configuration

Ansible connects using:
```
ansible_user=ubuntu
```

SSH key configured in `ansible.cfg`:
```
private_key_file = ~/Documents/k8s.pem
```

---

## Ansible Configuration

```ini
inventory = inventories/production/hosts.ini
remote_user = ubuntu
host_key_checking = False
roles_path = roles
timeout = 60
```

---

## Idempotency

The project is safe to run multiple times:
- kubeadm init runs only once
- Workers join only once
- Containerd config preserved
- Calico installed once
- Ingress installed once

---

## Testing

Cluster verification commands:
```
kubectl get nodes -o wide
kubectl get pods -A
kubectl get svc -A
```

Expected result:
```
All nodes Ready
System pods Running
```

---

## Destroy Infrastructure

```bash
cd terraform/enviroments/dev
terraform destroy
```

---

## Skills Demonstrated

- Infrastructure as Code
- Kubernetes Administration
- Ansible Automation
- Terraform Integration
- Cluster Networking
- Production Automation
- DevOps Pipelines
- Cloud Infrastructure
- Linux Administration

---

## CloudForge Platform

This Ansible project is part of the **CloudForge DevOps Platform**.

CloudForge provides:
- Terraform Infrastructure
- Kubernetes Automation
- Jenkins Pipelines
- Microservices Deployment

---

## Author

**Abdul Azeem**  
DevOps Engineer | Kubernetes | Terraform | Ansible | AWS

---

## Status

Production-ready Kubernetes automation. Validated on AWS infrastructure with fully automated cluster provisioning.
