# CloudForge Terraform CI/CD Pipeline 🚀

This document describes the **CloudForge Terraform Infrastructure Pipeline** built using **Jenkins + Terraform + AWS**.

This pipeline automates infrastructure validation, security scanning, and planning using **real production-style DevOps practices**.

The pipeline represents a **complete Infrastructure-as-Code CI/CD workflow**.

---

## Pipeline File

Pipeline definition:

```
Jenkinsfile-terraform
```

Terraform directory:

```
terraform/enviroments/dev
```

---

## Pipeline Architecture

The pipeline performs:

1. Git Checkout
2. Branch Preparation
3. Terraform Init
4. Terraform Format Automation
5. Terraform Validation
6. Security Scanning
7. Security Report Generation
8. GitOps Security Report Push
9. Terraform Plan
10. Plan Artifact Storage

This represents a **real Infrastructure Engineering workflow**.

---

## Pipeline Flow

```
GitHub Push
    ↓
Jenkins Trigger
    ↓
Checkout Code
    ↓
Prepare Branch
    ↓
Terraform Init
    ↓
Terraform Format Fix
    ↓
Terraform Validate
    ↓
Security Scan
    ↓
Security Report Push
    ↓
Terraform Plan
    ↓
Plan Archive
```

---

## Stage 1 – Checkout

Jenkins pulls latest code from GitHub.

```
checkout scm
```

Ensures:

- Latest infrastructure code
- Clean workspace
- Consistent execution

---

## Stage 2 – Git Branch Preparation

Pipeline prepares the correct working branch.

```
git checkout -B main
git reset --hard origin/main
```

Prevents:

- Detached HEAD issues
- Workspace conflicts
- Git inconsistencies

---

## Stage 3 – Terraform Init

Terraform initialization stage:

```
terraform init
```

Automatically:

- Downloads providers
- Installs modules
- Initializes backend
- Resolves dependencies

New Terraform modules are automatically installed.

---

## Stage 4 – Terraform Format Automation

Pipeline checks formatting:

```
terraform fmt -check -recursive terraform/
```

If formatting issues exist:

```
terraform fmt -recursive terraform/
```

Jenkins automatically:

- Fixes formatting
- Commits fixes
- Pushes fixes to GitHub

```
git add terraform/
git commit -m "Auto terraform fmt fix"
git push
```

This creates a **self-healing pipeline**.

---

## Stage 5 – Terraform Validate

Configuration validation:

```
terraform validate
```

Ensures:

- Valid syntax
- Correct module usage
- Valid variables
- Proper provider configuration

Prevents broken infrastructure deployments.

---

## Stage 6 – Security Scanning 🔐

Pipeline performs Terraform security analysis using:

### tfsec

```
tfsec terraform/
```

### Checkov (Optional)

```
checkov -d terraform/
```

Security checks include:

- Open security groups
- Public access risks
- Metadata service security
- Public subnet exposure
- Network configuration risks

Security scanning does **not fail the pipeline**.

This allows infrastructure review even with security findings.

---

## Stage 7 – Security Report Generation

Pipeline generates:

```
security-report.txt
```

Example:

```
CloudForge Terraform Security Report
------------------------------------

CRITICAL: 9
HIGH: 3
MEDIUM: 2
LOW: 14

Security issues detected.
```

If no issues exist:

```
Good to go.
```

The report is recreated on **every pipeline run**.

---

## Stage 8 – GitOps Security Report Push

Pipeline automatically pushes the latest report.

```
git add security-report.txt
git commit -m "Update security report"
git push
```

Benefits:

- Continuous security tracking
- Version history
- GitOps workflow

Future versions will push reports to **S3 instead of GitHub**.

---

## Stage 9 – Terraform Plan

Pipeline generates infrastructure plan.

```
terraform plan -out=tfplan
```

Shows:

- Resources to be created
- Resources to be modified
- Resources to be destroyed

No apply stage is included.

This prevents accidental infrastructure creation.

---

## Stage 10 – Plan Artifact Storage

Terraform plan stored inside Jenkins:

```
archiveArtifacts terraform/enviroments/dev/tfplan
```

Allows:

- Plan inspection
- Debugging
- Infrastructure review

---

## AWS Credential Injection 🔐

AWS credentials are injected from Jenkins Credentials Manager.

Environment variables used:

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

Credentials are **never stored in GitHub**.

This follows secure DevOps practices.

---

## Pipeline Features

### Self-Healing Infrastructure Pipeline

Pipeline automatically:

- Fixes Terraform formatting
- Commits fixes
- Updates security reports

Without manual work.

---

### Automated Security Monitoring

Every pipeline run produces:

```
security-report.txt
```

This provides:

- Continuous security visibility
- Infrastructure audit trail
- Security trend tracking

---

### Production-Level Workflow

Pipeline includes:

✔ Terraform Init  
✔ Terraform Validate  
✔ Terraform Format Automation  
✔ Security Scanning  
✔ Security Reporting  
✔ GitOps Integration  
✔ Artifact Storage  
✔ AWS Credential Injection  

This simulates **real Infrastructure Engineering pipelines used in production companies.**

---

## Security Design

The pipeline enforces:

- No Terraform Apply stage
- Secure credential injection
- Automated security scanning
- Infrastructure validation

This ensures safe infrastructure changes.

---

## Repository Structure

```
CloudForge/
│
├── Jenkinsfile-terraform
│
├── terraform/
│   ├── enviroments/
│   │   └── dev/
│   │
│   └── modules/
│
└── security-report.txt
```

---

## Future Improvements

Planned upgrades:

- Terraform Apply Pipeline
- Remote State (S3)
- DynamoDB Locking
- Trivy Integration
- Multi-Environment Pipelines
- Slack Notifications
- Cost Estimation
- Drift Detection

---

## Project Level

This pipeline represents an **Advanced DevOps Infrastructure Project**.

It demonstrates:

- Terraform CI/CD Engineering
- Jenkins Pipeline Design
- Infrastructure Security Automation
- GitOps Workflow
- AWS Infrastructure Automation
- Production DevOps Practices

This is **not a basic Terraform project**.

This is a **real Infrastructure Engineering pipeline.**
