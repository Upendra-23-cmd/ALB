# 🚀 Terraform AWS ALB Infrastructure (Production-Ready)

## 📌 Overview
This project provisions a production-grade AWS infrastructure using Terraform. It includes a custom VPC, Application Load Balancer (ALB), Auto Scaling Group (ASG), and EC2 instances using a Launch Template. The architecture follows best practices for scalability, high availability, and security.

---

## 🏗️ Architecture

```
Internet
│
┌────────────────────┐
│ Application Load │
│ Balancer (ALB) │
└─────────┬──────────┘
│
Target Group
│
┌────────┴─────────┐
│ │
EC2 (Private AZ1) EC2 (Private AZ2)
VPC (10.0.0.0/16)
├── Public Subnets (ALB)
│ ├── 10.0.1.0/24 (AZ1)
│ └── 10.0.2.0/24 (AZ2)
│
├── Private Subnets (EC2)
│ ├── 10.0.3.0/24 (AZ1)
│ └── 10.0.4.0/24 (AZ2)
│
├── Internet Gateway → Public Route Table
└── NAT Gateway → Private Route Table

```
---

## 📁 Project Structure

```
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
│
├── modules/
│ ├── vpc/
│ ├── security_groups/
│ ├── alb/
│ └── compute/
│
└── README.md

```
---

## 🔧 Infrastructure Components

### VPC
- Custom CIDR block (10.0.0.0/16)
- 2 Public subnets (Multi-AZ)
- 2 Private subnets (Multi-AZ)
- Internet Gateway
- NAT Gateway
- Route Tables

### Security Groups
- ALB Security Group:
  - Allows HTTP (80) and HTTPS (443) from internet
- EC2 Security Group:
  - Allows traffic only from ALB

### Compute
- Launch Template:
  - AMI, Instance type, Key pair, User data
- Auto Scaling Group:
  - Min, Max, Desired capacity
  - Deployed in private subnets

### ALB
- Internet-facing ALB in public subnets
- Target Group with health checks
- Listener on port 80 forwarding traffic

---

## 🧩 Terraform Concepts Used
- provider
- resource
- variable
- output
- modules
- locals
- data sources (optional)

---

## ▶️ Deployment Steps

### 1. Initialize
```
terraform init
```

### 2. Validate
```
terraform validate
```

### 3. Plan
```
terraform plan
```

### 4. Apply
```
terraform apply
```

---

## 📤 Outputs
After deployment:
alb_dns_name = http://<your-alb-dns>

---

## 🔐 Security Best Practices
- No public EC2 instances (only private subnets)
- ALB is the only public entry point
- Use IAM roles instead of credentials
- Restrict SSH access
- Enable HTTPS (ACM recommended)
- Enable logging and monitoring

---

## 📈 Benefits
- High Availability (Multi-AZ)
- Auto Scaling enabled
- Secure architecture
- Scalable and fault-tolerant
- Modular Terraform design

---

## 🧹 Cleanup
terraform destroy

---

## 🚀 Future Enhancements
- HTTPS using ACM
- AWS WAF integration
- CloudWatch monitoring
- CI/CD pipeline integration
- Remote backend (S3 + DynamoDB)

---

## 📄 License
MIT License