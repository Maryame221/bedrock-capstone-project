# Project Bedrock – AWS Cloud Infrastructure Capstone

## Overview

Project Bedrock is a cloud-native infrastructure project built as part of the AltSchool Africa Cloud Engineering Program.

The project demonstrates the deployment and management of a production-style AWS environment using Infrastructure as Code (Terraform), Kubernetes on Amazon EKS, serverless computing with AWS Lambda, managed databases, secure IAM configurations, and CI/CD automation with GitHub Actions.

---

## Architecture Components

### Compute & Container Orchestration

* Amazon EKS (Elastic Kubernetes Service)
* Managed Node Groups
* Kubernetes Deployments and Services
* AWS Load Balancer Controller

### Networking

* Custom VPC
* Public Subnets
* Internet Gateway
* Security Groups

### Storage & Data

* Amazon S3 Asset Bucket
* Amazon DynamoDB
* Amazon RDS MySQL
* Amazon RDS PostgreSQL

### Serverless

* AWS Lambda Function
* S3 Event Notifications

### Identity & Access Management

* IAM Roles and Policies
* OIDC Provider
* IAM Roles for Service Accounts (IRSA)
* Read-Only IAM User
* EKS Access Policies

### Automation & CI/CD

* Terraform
* GitHub Actions

---

## Project Features

### Infrastructure as Code

All cloud resources are provisioned and managed using Terraform.

### Kubernetes Deployment

Applications are deployed on Amazon EKS and exposed through an Application Load Balancer.

### Event-Driven Processing

Uploading files to the S3 bucket automatically triggers an AWS Lambda function.

### Database Layer

The environment includes:

* MySQL RDS Instance
* PostgreSQL RDS Instance

### Secure Access Control

IAM and IRSA are used to provide least-privilege access to AWS resources.

### Continuous Integration & Deployment

GitHub Actions automates Terraform validation and deployment workflows.

---

## Terraform Outputs

The project generates the following outputs:

* VPC ID
* Lambda Function Name
* MySQL Endpoint
* PostgreSQL Endpoint

---

## Repository Structure

```text
.
├── terraform/
│   ├── vpc.tf
│   ├── eks.tf
│   ├── rds.tf
│   ├── lambda.tf
│   ├── dynamodb.tf
│   ├── iam.tf
│   ├── outputs.tf
│   └── ...
├── lambda/
│   └── lambda_function.py
├── .github/
│   └── workflows/
│       └── terraform.yml
└── ui-ingress.yaml
```

---

## Technologies Used

* AWS
* Terraform
* Kubernetes
* Amazon EKS
* Amazon RDS
* Amazon DynamoDB
* AWS Lambda
* Amazon S3
* IAM
* GitHub Actions
* Docker

---

## Learning Outcomes

This project strengthened my skills in:

* Cloud Infrastructure Design
* Infrastructure as Code (IaC)
* Kubernetes Administration
* AWS Networking
* Identity and Access Management
* CI/CD Automation
* Troubleshooting Cloud Infrastructure
* Production Environment Deployment

---

# Resubmission Update

This repository has been updated based on the feedback received from the initial submission.

## Improvements Made

- ✅ Provisioned **Amazon RDS MySQL** using Terraform.
- ✅ Provisioned **Amazon RDS PostgreSQL** using Terraform.
- ✅ Integrated **AWS Secrets Manager** for database credentials.
- ✅ Updated the Retail Store application to use **Amazon RDS** instead of in-cluster databases.
- ✅ Updated Helm deployment configuration to use external database endpoints.
- ✅ Verified Kubernetes ConfigMaps and Secrets.
- ✅ Successfully redeployed the Retail Store application on Amazon EKS.
- ✅ Validated application connectivity through an internet-facing AWS Application Load Balancer (ALB).

---

# Retail Store Application

## Live Application

**Application URL**

http://k8s-retailap-retailst-17d19cf248-1781247922.us-east-1.elb.amazonaws.com/

---

# Solution Architecture

<img width="1536" height="1024" alt="Architecture Diagram" src="https://github.com/user-attachments/assets/85f06b3b-1e31-4ace-95d1-6fa8cd831ec5" />


The solution consists of:

- GitHub
- GitHub Actions
- Terraform
- Amazon VPC
- Amazon EKS
- Amazon ECR Public Images
- AWS Load Balancer Controller
- Amazon RDS (MySQL)
- Amazon RDS (PostgreSQL)
- Amazon DynamoDB
- Amazon S3
- AWS Lambda
- AWS Secrets Manager
- IAM
- Kubernetes
- Helm

---

# AWS Services Used

| Service | Purpose |
|----------|---------|
| Amazon VPC | Networking |
| Amazon EKS | Kubernetes Cluster |
| EC2 Managed Node Group | Worker Nodes |
| Amazon RDS MySQL | Catalog Database |
| Amazon RDS PostgreSQL | Orders Database |
| Amazon DynamoDB | Shopping Cart Storage |
| Amazon S3 | Asset Storage |
| AWS Lambda | Image Processing |
| AWS Secrets Manager | Database Credentials |
| IAM | Access Management |
| Application Load Balancer | External Application Access |
| CloudWatch | Logging & Monitoring |

---

# Infrastructure Provisioning

Infrastructure is provisioned using **Terraform**.

## Components Provisioned

- VPC
- Public and Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Amazon EKS Cluster
- Managed Node Group
- Amazon RDS (MySQL)
- Amazon RDS (PostgreSQL)
- DynamoDB Table
- S3 Bucket
- Lambda Function
- Secrets Manager Secrets
- IAM Roles and Policies

---

# Application Deployment

The Retail Store Sample Application is deployed on Amazon EKS using Helm.

## Microservices

- UI
- Catalog
- Cart
- Checkout
- Orders

---

# Database Configuration

## Catalog Service

- Persistence Provider: Amazon RDS MySQL
- Database: `retail`

## Orders Service

- Persistence Provider: Amazon RDS PostgreSQL
- Database: `orders`

Database credentials are securely managed using AWS Secrets Manager and Kubernetes Secrets.

---

# Kubernetes Resources

The deployment includes:

- Deployments
- Services
- ConfigMaps
- Secrets
- Ingress
- Service Accounts

Ingress traffic is managed using the AWS Load Balancer Controller.

---

# Security

The project implements several AWS security best practices.

## IAM

- Least privilege IAM policies
- Dedicated developer IAM user
- ReadOnlyAccess policy
- Custom S3 PutObject policy

## Secrets Management

Database credentials are stored in:

- AWS Secrets Manager
- Kubernetes Secrets

No production credentials are intended to be committed to source control.

## Networking

- Private RDS instances
- Security Groups
- Private Subnets
- Public ALB

---

# CI/CD Pipeline

GitHub Actions automates infrastructure validation and deployment.

Pipeline stages include:

- Terraform Format
- Terraform Validate
- Terraform Plan
- Terraform Apply (manual approval)
- Infrastructure Deployment

---

# Validation

The following components were successfully validated:

- ✅ Amazon EKS Cluster
- ✅ Kubernetes Worker Nodes
- ✅ Retail Store Application
- ✅ Application Load Balancer
- ✅ Amazon RDS MySQL
- ✅ Amazon RDS PostgreSQL
- ✅ Amazon DynamoDB
- ✅ AWS Lambda
- ✅ Amazon S3
- ✅ AWS Secrets Manager
- ✅ IAM Configuration
- ✅ Kubernetes ConfigMaps
- ✅ Kubernetes Secrets

---

# Deployment Steps

## Clone Repository

```bash
git clone https://github.com/Maryame221/bedrock-capstone-project.git
cd bedrock-capstone-project
```

## Provision Infrastructure

```bash
cd terraform

terraform init

terraform plan

terraform apply
```

## Deploy the Application

```bash
cd retail-store-sample-app/src/app

helmfile sync
```

---

# Project Structure

```
Capstone-Project/
│
├── .github/
│   └── workflows/
│
├── lambda/
│
├── terraform/
│   ├── eks.tf
│   ├── vpc.tf
│   ├── rds.tf
│   ├── secrets.tf
│   ├── dynamodb.tf
│   ├── lambda.tf
│   └── s3.tf
│
├── deployment/
│   └── helm/
│       └── helmfile.yaml
│
├── grading.json
│
└── README.md
```

---

# Screenshots Included

This submission includes screenshots demonstrating:

- GitHub Repository
- GitHub Actions
- Amazon EKS
- Amazon RDS
- Amazon DynamoDB
- AWS Secrets Manager
- AWS Lambda
- Amazon S3
- Application Load Balancer
- Retail Store Application
- Kubernetes Pods
- Kubernetes Services
- Kubernetes Ingress

---

# Cleanup

To remove all AWS resources:

```bash
terraform destroy
```

---

# Author

**Maryame Diom**

AltSchool Africa — Cloud Engineering Program

Cloud Engineering Student | Cybersecurity Graduate | AWS & DevOps Enthusiast

GitHub: https://github.com/Maryame221
LinkedIn: https://www.linkedin.com/in/maryame-diom

---

# Acknowledgements

- AltSchool Africa
- AWS Retail Store Sample Application
- Terraform
- Kubernetes
- Helm
- Amazon Web Services

