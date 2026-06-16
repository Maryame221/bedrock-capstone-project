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

## Author

**Maryame Diom**

Cloud Engineering Student | Cybersecurity Graduate | AWS & DevOps Enthusiast

GitHub: https://github.com/Maryame221
LinkedIn: https://www.linkedin.com/in/maryame-diom
