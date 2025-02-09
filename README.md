# DevOps Infrastructure Repository (devops-infra)

## Overview
The **devops-infra** repository is the core infrastructure repository for deploying and managing cloud resources for the **counter-service** application. It contains Infrastructure as Code (IaC) implementations using Terraform to automate provisioning, configuration, and maintenance of AWS resources, including Kubernetes (EKS), networking, and storage. The repository also includes CI/CD pipelines for seamless deployment and integration with GitHub Actions and ArgoCD.

## Features
- **Infrastructure as Code (IaC)**: Uses Terraform to provision AWS resources such as VPC, EKS, IAM, and S3.
- **GitOps Deployment**: Utilizes ArgoCD for automated Kubernetes deployments from GitHub.
- **CI/CD Pipelines**: Implements GitHub Actions to validate, deploy, and destroy infrastructure.
- **Kustomize & Helm Support**: Supports both Kustomize and Helm for Kubernetes deployments.
- **Security & Best Practices**: Implements RBAC, least privilege IAM policies, and encrypted S3 remote state.
- **Automated Testing & Validation**: Includes Terraform validation, YAML linting, and pre-deployment checks.

## Deployment Workflow
1. **Provision Infrastructure**:
   - Push changes to the `infra` folder.
   - GitHub Actions validates Terraform configurations.
   - Terraform applies changes to AWS and provisions the necessary resources.
2. **Monitor & Manage**:
   - Use ArgoCD UI to monitor deployments.
   - Kubernetes logs and metrics are available via AWS CloudWatch.

## Prerequisites
To use this repository, ensure you have:
- AWS credentials with required permissions.
- Terraform installed (`>= 1.10.5`).
- kubectl and AWS CLI configured.
- GitHub Actions secrets configured for OIDC authentication.

## Contributions
Feel free to submit pull requests and issues for improvements. Make sure to follow the branch naming conventions and create merge requests when modifying infrastructure components.

## License
This repository is licensed under Check Point's internal guidelines.

