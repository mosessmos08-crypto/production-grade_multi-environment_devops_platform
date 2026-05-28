# Production-Grade Multi-Environment DevOps Platform (AWS)

## Overview

This project demonstrates a production-style DevOps setup with multiple environments using AWS, Docker, Terraform, and GitHub Actions. It implements a complete CI/CD pipeline with automated deployment, health checks, rollback strategy, and monitoring.

---

## Architecture

Developer → GitHub → GitHub Actions (CI/CD) → Docker Hub → EC2 (Staging & Production) → CloudWatch Monitoring

---

## Environments

| Branch   | Environment | Description          |
|----------|------------|----------------------|
| dev      | Development | Local testing & build |
| staging  | Staging     | Pre-production testing |
| prod     | Production  | Live deployment |

---

## Tools & Technologies

- AWS (EC2, S3, CloudWatch)
- Docker
- Terraform
- GitHub Actions
- Python (Flask)

---

## CI/CD Pipeline Flow

1. Code is pushed to a branch
2. GitHub Actions triggers pipeline
3. Docker image is pulled from Docker Hub
4. Application is deployed to EC2
5. Health check is performed
6. If health check fails, rollback is triggered

---

## Deployment Strategy

- Docker-based deployment
- Container replacement on each deployment
- Previous image retained for rollback

---

## Rollback Strategy

- Automated rollback on health check failure
- Previous stable Docker image is redeployed
- Ensures minimal downtime and quick recovery

---

## Monitoring

- AWS CloudWatch Agent installed on EC2
- Metrics collected:
  - CPU Utilization
  - Memory Usage
  - Disk Usage
- CloudWatch alarms configured for threshold breaches

---

## Infrastructure (Terraform)

- Separate configuration for each environment
- Remote backend using S3
- State locking using DynamoDB

---

## Key Features

- Multi-environment setup (dev, staging, prod)
- Automated CI/CD pipeline
- Health check based deployment validation
- Automated rollback mechanism
- Cloud monitoring and alerting

---

## How to Run

1. Push code to the desired branch (dev / staging / prod)
2. GitHub Actions will trigger deployment
3. Application will be deployed to corresponding EC2 instance
4. Monitor via CloudWatch

---

## Notes

- Production deployments are handled via the `prod` branch
- Ensure correct secrets are configured in GitHub Environments
- Terraform state is managed remotely in S3

---
