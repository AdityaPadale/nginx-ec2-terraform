# nginx-ec2-terraform 

This repo is basically how I created an EC2 instance on AWS and deployed Nginx on it automatically using Terraform. No manual click-click on AWS console, everything is IaC vibes 🤌.

---

##  Why I built this?

I wanted to learn how automation really works on AWS, instead of manually launching EC2, connecting via SSH and installing Nginx every single time.  
So the idea was simple:

> “Write code → run terraform apply → EC2 launches + Nginx installed automatically.”

And guess what? It actually worked 

---

##  What I created

Here’s what this Terraform code does:

✔ Spins up an EC2 instance using Amazon Linux  
✔ Creates a Security Group allowing SSH (22) + HTTP (80)  
✔ Installs Nginx automatically using `user_data`  
✔ Exposes the public IP so I can access it directly in my browser  

---

##  Files I used & why

| File | Why I created it |
|-------|------------------|
| `provider.tf` | To tell Terraform that I’m using AWS and in which region |
| `security-groups.tf` | To allow HTTP + SSH on the EC2 instance |
| `key.tf` | To generate my key-pair so I can SSH if needed |
| `ec2-app.tf` | Main logic — creates EC2, installs nginx, exposes IP |
| `output.tf` | Just to show the instance IP after deployment |

---

##  How I wrote the nginx installation part

Inside EC2 resource I used user-data like this:

```bash
#!/bin/bash
yum update -y
yum install nginx -y
systemctl enable nginx
systemctl start nginx
