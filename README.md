# DevOps Project: Terraform + Jenkins CI/CD Pipeline

## 📌 Overview
This project demonstrates an automated CI/CD pipeline that validates Terraform infrastructure code before deployment. It enforces node count and security rules, preventing misconfigurations from reaching production.

## 🛠️ Tools Used
- **Jenkins** – CI/CD orchestration
- **Terraform** – Infrastructure as Code
- **GitHub** – Version control + status tracking
- **Docker** – Jenkins container runtime

## 🔁 Pipeline Stages
1. **Checkout** – Pull code from GitHub
2. **Terraform Init** – Initialize providers
3. **Terraform Validate** – Syntax check
4. **Node Count Validation** – Ensure node_count = 3
5. **Security Check** – Block insecure firewall rules (0.0.0.0/0)
6. **Push Status** – Save validation result to GitHub

## ✅ Why This Matters
- Prevents infrastructure drift
- Enforces cost control (minimum 3 nodes)
- Blocks insecure security group rules
- Automates infrastructure review

## 📂 Repository Structure
devops-lab/
├── Jenkinsfile
├── main.tf
├── README.md
└── tf-status.txt (auto-generated)


## 🧪 Sample Pipeline Output
✅ Code checked out
✅ Terraform init
✅ Terraform validate passed
✅ Node count is 3
✅ Basic security check passed
✅ Status pushed to GitHub
🎉 Terraform validation pipeline SUCCESS!


## 🔧 How to Reproduce
1. Clone this repository
2. Set up Jenkins with Terraform and GitHub credentials
3. Create a pipeline pointing to this Jenkinsfile
4. Run the pipeline

## 📬 Contact
**Ghemarc "Mark" Dela Cruz**  
[LinkedIn](https://linkedin.com/in/yourprofile) | [GitHub](https://github.com/Ghemarc-star)

---
*This project is part of my DevOps portfolio.*
