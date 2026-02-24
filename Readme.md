# 🚀 CloudForge – Production-Oriented Microservices Platform on AWS

CloudForge is an end-to-end, production-style DevOps platform built from scratch using **Terraform, kubeadm, and Kubernetes** to deploy a distributed microservices architecture on AWS.

This project focuses on understanding **how Kubernetes is actually meant to be used — for microservices**, not just basic 3-tier applications.

---

## 🏗 Architecture Overview

### 🔹 Infrastructure (Terraform on AWS)

- Custom VPC  
- Public Subnet  
- Internet Gateway  
- Route Tables  
- Security Groups  
- EC2 Instances (Control Plane + Worker Nodes)  
- EBS-backed nodes  
- Cost-optimized architecture  

Infrastructure is provisioned entirely using **Infrastructure as Code (Terraform)**.

---

### 🔹 Kubernetes Cluster (kubeadm-based)

- Manual kubeadm bootstrap  
- containerd as container runtime  
- Calico CNI for networking  
- Metrics Server for autoscaling  
- NGINX Ingress Controller for Layer-7 routing  
- Dedicated Admin/Jenkins node for cluster management  

No managed Kubernetes (no EKS). Everything is manually configured and production-structured.

---

## 🧩 Microservices Architecture

This project deploys the **Google Microservices Demo**, structured for production-like environments.

Each service:

- Runs in its own namespace  
- Uses Deployment or StatefulSet appropriately  
- Has resource requests and limits defined  
- Uses proper ClusterIP services  
- Communicates via full DNS-based service discovery  
- Includes Horizontal Pod Autoscalers (HPA) for stateless services  

---

## 📦 Services Deployed

- **Redis** (StatefulSet + PVC)  
- Cart Service (Redis-dependent)  
- Product Catalog Service  
- Currency Service  
- Recommendation Service  
- Ad Service  
- Shipping Service  
- Email Service  
- Payment Service  
- Checkout Service (multi-service orchestrator)  
- Shopping Assistant Service  
- Frontend (Ingress exposed)  
- Load Generator (traffic simulation)  

---

## 📈 Scaling & Traffic Handling

- Horizontal Pod Autoscalers (HPA) enabled  
- Metrics Server validated before scaling  
- Load Generator used to simulate production-like traffic  
- CPU-based autoscaling configured  
- Stateless services scale independently  

---

## 🌐 Networking & Routing

- Cross-namespace DNS resolution  
- ClusterIP services for internal communication  
- NGINX Ingress Controller for external access  
- HTTP and gRPC-based communication  
- Clean separation between internal and external traffic  

---

## 🔍 Real-World Engineering Challenge

During full deployment, worker nodes began evicting pods due to:

DiskPressure: True  
EvictionThresholdMet  
node.kubernetes.io/disk-pressure:NoSchedule  

Root cause:  
Small root EBS volumes (~8GB) caused ephemeral storage exhaustion due to container images and logs.

Resolution:  
Infrastructure-level scaling via Terraform (EBS volume expansion).

This highlighted that production reliability depends not just on Kubernetes manifests, but also on underlying infrastructure design.

---

## 🧠 Key Learnings

- Deployment order matters in distributed systems  
- Reading application code before writing manifests prevents runtime failures  
- HPA requires a properly functioning metrics-server  
- Ingress is structured routing, not magic  
- Cross-namespace DNS is critical in microservices  
- Infrastructure constraints (like disk size) directly impact cluster stability  

---

## 🔮 Next Steps

- CI/CD pipeline integration  
- Blue-Green deployment strategy  
- Monitoring stack (Prometheus + Grafana)  
- TLS with cert-manager  
- Cost optimization improvements  
- Production hardening (PodDisruptionBudgets, NetworkPolicies)  

---

## 📁 Repository

Source Code:  
https://github.com/getAzeem/CloudForge.git

---

## 📌 Tech Stack

- AWS EC2  
- Terraform  
- Kubernetes (kubeadm)  
- containerd  
- Calico  
- NGINX Ingress  
- Metrics Server  
- Docker  
- Go / Python Microservices  

---

CloudForge represents a hands-on exploration of platform engineering principles, focusing on real distributed system behavior rather than simplified deployment patterns.
