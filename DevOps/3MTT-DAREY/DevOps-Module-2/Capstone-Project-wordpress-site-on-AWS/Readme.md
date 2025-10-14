# 🚀 AWS Scalable WordPress Deployment

## 📋 Project Overview

This project documents the design and implementation of a **highly available, scalable, and secure WordPress website** for **DigitalBoost** on **Amazon Web Services (AWS)**.

It leverages a modular Infrastructure-as-Code (IaC) approach using **AWS CloudFormation**, ensuring that the solution can be easily replicated, updated, and maintained across environments.

---

## 🧱 Architecture Summary

| Feature | AWS Service Used | Best Practice Implemented |
|----------|------------------|----------------------------|
| **High Availability** | VPC, ALB, ASG | Multi-AZ deployment across `us-east-1a` and `us-east-1b`. |
| **Scalability** | Auto Scaling Group | Dynamically adjusts EC2 capacity based on CPU Utilization. |
| **Security** | VPC, Private Subnets, Security Groups | Defense-in-depth network isolation and least-privilege access control. |
| **Data Persistence** | Amazon RDS (MySQL), Amazon EFS | Managed database service and shared, scalable file system. |

---

## 🏗️ Architecture Design

### ⚙️ Core Components

- **VPC & Subnets** – Custom VPC with multiple public and private subnets across two Availability Zones.  
- **Internet & NAT Gateways** – Public internet access for ALB and controlled outbound access for private EC2s.  
- **Application Load Balancer (ALB)** – Balances incoming requests across multiple EC2 instances.  
- **Auto Scaling Group (ASG)** – Automatically scales EC2 instances based on CPU utilization.  
- **Amazon RDS (MySQL)** – Managed, multi-AZ database for reliability.  
- **Amazon EFS** – Shared file system for persistent WordPress content.  
- **Security Groups** – Layered security enforcing SG-to-SG access.  

---

## 🧩 Folder Structure

aws-scalable-wordpress/
│
├── README.md
├── LICENSE
│
├── /diagrams/
│ ├── architecture-diagram.png
│ ├── network-diagram.png
│
├── /templates/
│ ├── vpc-template.yaml
│ ├── rds-template.yaml
│ ├── wordpress-asg-template.yaml
│ ├── alb-template.yaml
│
├── /scripts/
│ ├── deploy.sh
│ ├── wordpress-setup.sh
│ ├── efs-mount.sh
│
├── /screenshots/
│ ├── vpc-creation.png
│ ├── alb-setup.png
│ ├── autoscaling-group.png
│
└── .gitignore

---

## ⚙️ Infrastructure as Code (IaC)

This project uses **AWS CloudFormation** for fully automated deployment.

| Component | Template | Description |
|------------|-----------|--------------|
| Networking | `vpc-template.yaml` | Defines VPC, subnets, and gateways |
| Database | `rds-template.yaml` | Deploys MySQL RDS instance |
| Application | `wordpress-asg-template.yaml` | Defines EC2 launch and scaling setup |
| Load Balancer | `alb-template.yaml` | Creates ALB and listener rules |

---

## 🛠️ Step-by-Step Implementation

### 1️⃣ VPC Setup

| Step | Action | Best Practice | |
|------|---------|---------------|-|
| 1.1 | Create `Dev-VPC (10.0.0.0/16)` | Network Isolation | ![vpc](screenshots/vpc-creation.png) |
| 1.2 | Create 6 subnets (3 Public, 3 Private) | Multi-AZ High Availability | |
| 1.3 | Attach Internet Gateway | Enables public subnet connectivity | |
| 1.4 | Configure public and private route tables | Defines routing and isolation | |

---

### 2️⃣ NAT Gateway & Private Routing

| Step | Action | Best Practice |
|------|---------|---------------|
| 2.1 | Allocate 2 Elastic IPs | Static IPs for NAT redundancy |
| 2.2 | Deploy 2 NAT Gateways (one per AZ) | Redundancy for outbound traffic |
| 2.3 | Configure Private Route Tables per AZ | Ensures resilience and isolation |
| 2.4 | Route 0.0.0.0/0 via NAT Gateway | Enables secure outbound connectivity |

---

### 3️⃣ AWS MySQL RDS Setup

| Step | Action | Best Practice |
|------|---------|---------------|
| 3.1 | Create DB Subnet Group in private subnets | Multi-AZ redundancy |
| 3.2 | Launch RDS MySQL instance | Managed database with backups |
| 3.3 | Apply Database Security Group | Allow only from Webserver SG |

---

### 4️⃣ Amazon EFS Setup

| Step | Action | Best Practice |
|------|---------|---------------|
| 4.1 | Create EFS File System | Highly scalable shared storage |
| 4.2 | Create EFS Mount Targets in private subnets | Multi-AZ accessibility |

---

### 5️⃣ Application Load Balancer (ALB)

| Step | Action | Best Practice |
|------|---------|---------------|
| 5.1 | Create Target Group (wordpress-tg) | Health checks for availability |
| 5.2 | Deploy ALB in public subnets | Multi-AZ redundancy |
| 5.3 | Configure HTTP listener | Routes requests to target group |

---

### 6️⃣ Auto Scaling Group (ASG)

| Step | Action | Best Practice |
|------|---------|---------------|
| 6.1 | Create Launch Template | Consistent provisioning |
| 6.2 | Create ASG in private subnets | High Availability |
| 6.3 | Configure Target Tracking policy (CPU ≥ 50%) | Elasticity |
| 6.4 | Set Min(2), Desired(2), Max(4) | Minimum guaranteed capacity |

---

## 🛡️ Security Groups Overview

| Security Group | Port | Protocol | Source | Purpose |
|----------------|------|-----------|---------|----------|
| **ALB-SG** | 80, 443 | TCP | 0.0.0.0/0 | Public web access |
| **Webserver-SG** | 80 | TCP | ALB-SG | Allow HTTP from ALB only |
| **Database-SG** | 3306 | TCP | Webserver-SG | MySQL access from web servers |
| **EFS-SG** | 2049 | TCP | Webserver-SG | NFS mount from EC2 |
| **SSH-SG** | 22 | TCP | Your IP | Limited admin access |

---

## ⚡ Example CloudFormation Templates

### 🧩 VPC Template (`/templates/vpc-template.yaml`)
```yaml
AWSTemplateFormatVersion: 2010-09-09
Description: VPC setup for WordPress Deployment

Resources:
  DevVPC:
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: 10.0.0.0/16
      EnableDnsSupport: true
      EnableDnsHostnames: true
      Tags:
        - Key: Name
          Value: Dev-VPC

  InternetGateway:
    Type: AWS::EC2::InternetGateway
    Properties:
      Tags:
        - Key: Name
          Value: Dev-IGW

  AttachGateway:
    Type: AWS::EC2::VPCGatewayAttachment
    Properties:
      VpcId: !Ref DevVPC
      InternetGatewayId: !Ref InternetGateway

Outputs:
  VPCId:
    Description: VPC ID
    Value: !Ref DevVPC
```

## 🧩 RDS Template (/templates/rds-template.yaml)

```yaml
AWSTemplateFormatVersion: 2010-09-09
Description: MySQL RDS setup for WordPress

Parameters:
  DBUsername:
    Type: String
  DBPassword:
    Type: String
    NoEcho: true

Resources:
  DBSubnetGroup:
    Type: AWS::RDS::DBSubnetGroup
    Properties:
      DBSubnetGroupDescription: Private subnets for RDS
      SubnetIds:
        - subnet-123456
        - subnet-789012

  WordPressDB:
    Type: AWS::RDS::DBInstance
    Properties:
      DBInstanceClass: db.t3.micro
      AllocatedStorage: 20
      Engine: mysql
      MasterUsername: !Ref DBUsername
      MasterUserPassword: !Ref DBPassword
      DBSubnetGroupName: !Ref DBSubnetGroup
      MultiAZ: true
      PubliclyAccessible: false
```

## 🧩 ASG Template (/templates/wordpress-asg-template.yaml)

```yaml

AWSTemplateFormatVersion: 2010-09-09
Description: Auto Scaling Group for WordPress

Resources:
  WordPressLaunchTemplate:
    Type: AWS::EC2::LaunchTemplate
    Properties:
      LaunchTemplateData:
        ImageId: ami-0abcdef1234567890
        InstanceType: t3.micro
        SecurityGroupIds:
          - sg-123456
        UserData: !Base64 |
          #!/bin/bash
          yum update -y
          yum install -y httpd php php-mysqlnd amazon-efs-utils
          systemctl enable httpd
          systemctl start httpd
          mount -t efs fs-123456:/ /var/www/html
          echo "<?php phpinfo(); ?>" > /var/www/html/index.php

  WordPressASG:
    Type: AWS::AutoScaling::AutoScalingGroup
    Properties:
      MinSize: 2
      MaxSize: 4
      DesiredCapacity: 2
      LaunchTemplate:
        LaunchTemplateId: !Ref WordPressLaunchTemplate
        Version: !GetAtt WordPressLaunchTemplate.LatestVersionNumber
```

## 🧩 ALB Template (/templates/alb-template.yaml)

```yaml

AWSTemplateFormatVersion: 2010-09-09
Description: Application Load Balancer for WordPress

Resources:
  WordPressALB:
    Type: AWS::ElasticLoadBalancingV2::LoadBalancer
    Properties:
      Name: wordpress-alb
      Scheme: internet-facing
      Subnets:
        - subnet-111aaa
        - subnet-222bbb
      SecurityGroups:
        - sg-alb123
      Type: application

  WordPressTargetGroup:
    Type: AWS::ElasticLoadBalancingV2::TargetGroup
    Properties:
      Name: wordpress-tg
      Port: 80
      Protocol: HTTP
      TargetType: instance
      VpcId: vpc-123abc

  ALBListener:
    Type: AWS::ElasticLoadBalancingV2::Listener
    Properties:
      LoadBalancerArn: !Ref WordPressALB
      Port: 80
      Protocol: HTTP
      DefaultActions:
        - Type: forward
          TargetGroupArn: !Ref WordPressTargetGroup

Outputs:
  ALBDNS:
    Description: ALB DNS Name
    Value: !GetAtt WordPressALB.DNSName
```


## ⚙️ Deployment Automation (scripts/deploy.sh)

```bash
#!/bin/bash
# deploy.sh - Automated deployment for AWS Scalable WordPress Project
# Usage: bash deploy.sh

STACK_NAME="digitalboost-wordpress"
REGION="us-east-1"

aws cloudformation deploy \
  --template-file ../templates/vpc-template.yaml \
  --stack-name ${STACK_NAME}-vpc \
  --region $REGION \
  --capabilities CAPABILITY_NAMED_IAM

aws cloudformation deploy \
  --template-file ../templates/rds-template.yaml \
  --stack-name ${STACK_NAME}-rds \
  --region $REGION \
  --parameter-overrides DBUsername=admin DBPassword=YourStrongPassword123

aws cloudformation deploy \
  --template-file ../templates/wordpress-asg-template.yaml \
  --stack-name ${STACK_NAME}-asg \
  --region $REGION \
  --capabilities CAPABILITY_NAMED_IAM

aws cloudformation deploy \
  --template-file ../templates/alb-template.yaml \
  --stack-name ${STACK_NAME}-alb \
  --region $REGION \
  --capabilities CAPABILITY_NAMED_IAM

echo "✅ Deployment complete!"
```

## 📊 Demonstration & Validation

🔗 Live Site Access

The WordPress site will be accessible via the ALB DNS Name:

```bash
http://<ALB-DNS-NAME>
```

## 🔄 Auto-Scaling Test

- Observe baseline (2 EC2 instances running).
- Run a stress test (e.g., ApacheBench) to drive CPU > 50%.
- ASG automatically scales out to 3-4 instances.
- After cooldown, CPU drops and ASG scales in again.

## 👥 Project Contact
|Role	|Name	|Email
|-----|-----|------|
|Solution Architect	|Abraham Aigbokhan   | abraham.aigbokhan@outlook.com


## 🏁 License

This project is licensed under the MIT License — see the LICENSE
 file for details.

 ```yaml

Would you like me to **add a `.github/workflows/deploy.yml` GitHub Actions CI/CD pipeline** so the infrastructure automatically deploys when you push to the `main` branch?  
That would make your project **cloud-ready with zero-touch automation**.

```
