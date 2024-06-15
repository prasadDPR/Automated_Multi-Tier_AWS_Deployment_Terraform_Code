# Automated Multi-Tier AWS Deployment with Terraform and GitHub Actions
This document outlines the process for deploying a multi-tier architecture on AWS using Terraform code in an automated way. This architecture consists of a web server running in a private subnet, a MySQL database in a private subnet, an S3 bucket for error pages, and a CloudFront distribution for routing traffic.

![Hosting in AWS](https://github.com/prasadDPR/cicd-aws-project/assets/121819069/9356c818-bbfa-49f3-b595-9101582deeb7)

# Deployment Steps

Terraform Configuration Files: Create Terraform files (.tf) defining the infrastructure components: VPC, subnets, security groups, EC2 instance (web server), RDS instance (MySQL database), S3 bucket, and CloudFront distribution.

Optional: Terraform Backend Configuration: Configure Terraform Cloud workspace to manage your Terraform state remotely (recommended for collaboration and state management).

GitHub Actions Workflow: Create a workflow YAML file (.yml) in the .github/workflows directory of your GitHub repository. This workflow will automate deployments upon code changes.

Trigger Terraform Cloud Deployments: Within the workflow YAML file, use the Terraform Cloud Actions provider to initiate deployments on Terraform Cloud. This involves authorizing Terraform Cloud access and specifying the Terraform configuration files and workspace to be used.

Optional: Auto-Apply in Terraform Cloud:  Enable auto-apply in Terraform Cloud workspace settings. This automatically applies infrastructure changes defined in your Terraform configuration files whenever a new version is pushed to your repository (assuming the workflow runs successfully).

Explanation:

Auto-apply is an optional but powerful feature that automates infrastructure deployment upon code pushes. However, it's essential to thoroughly test your Terraform code before enabling auto-apply to avoid unintended deployments.
