# Mini Project — Configuring Auto Scaling with ALB using a Launch Template

## Purpose

This document provides a **step‑by‑step guide** to implement the mini project shown in your screenshots: create a Launch Template, set up an Auto Scaling Group (ASG), configure scaling policies, attach an Application Load Balancer (ALB), and test auto scaling. It also includes **best practices** mapped to the AWS Well‑Architected Framework and a professional README you can keep in your repo.

> **Assumptions & prerequisites**
>
> * You have an AWS account with privileges to create EC2, IAM roles, ALB (Elastic Load Balancing v2), Auto Scaling, CloudWatch, and VPC resources.
> * You know the target AWS region and have at least two subnets in separate Availability Zones (AZs).
> * You have (or will create) an SSH keypair if you want SSH access; otherwise use SSM Session Manager.
> * Cost warning: launching instances, ALB, and data transfer may incur charges. Use small instance types for testing and remember to clean up.

---

## Table of contents

1. Task 1 — Create Launch Template
2. Task 2 — Set Up Auto Scaling Group
3. Task 3 — Configure Scaling Policies
4. Task 4 — Attach ALB to Auto Scaling Group
5. Task 5 — Test Auto Scaling
6. Best practices & AWS Well‑Architected guidance
7. Validation checklist
8. Cleanup commands
9. README (final deliverable you can copy to GitHub)

---

## 1) Task 1 — Create Launch Template (detailed steps)

**Goal:** Create a repeatable Launch Template that defines how new EC2 instances start (AMI, instance type, IAM role, user data, volumes, tags).

### Console steps

1. Sign in to AWS Management Console → **EC2** → left nav → **Launch Templates**.
2. Click **Create launch template**.
3. Enter **Launch template name** (e.g. `asg-web-launch-template`) and a descriptive **Description**.
4. **AMI**: choose the latest Amazon Linux 2 (or your preferred Linux) AMI for your region. (Do not hard‑code AMI IDs in documentation — pick the latest at creation time.)
5. **Instance type**: choose a small instance for testing (e.g. `t3.micro` / `t3a.nano`) — choose based on workload.
6. **Key pair**: select an existing keypair if you want SSH; if you prefer SSM Session Manager leave blank and ensure the instance role has SSM permissions.
7. **Network settings / Security groups**: select or create a security group that:

   * Allows inbound **HTTP (80)** from `0.0.0.0/0` (or better limit to load balancer SG);
   * Allows **SSH (22)** only from your admin IP (or disable SSH if SSM used);
   * Allows outbound traffic to required services.
8. **IAM instance profile**: attach an instance profile (IAM role) with at least these managed policies:

   * `AmazonSSMManagedInstanceCore` (SSM access)
   * `CloudWatchAgentServerPolicy` (if you plan to send metrics/logs to CloudWatch)
9. **User data**: paste a script that installs your application and configures the instance. Example (Amazon Linux 2):

```bash
#!/bin/bash
yum update -y
# Simple web app
yum install -y httpd
cat <<'EOF' >/var/www/html/index.html
<html><body><h1>ASG Instance: $(hostname -f)</h1></body></html>
EOF
systemctl enable httpd
systemctl start httpd
# Install CloudWatch Agent (optional)
# mkdir /opt/aws && cd /opt/aws && yum install -y amazon-cloudwatch-agent
```

10. **Storage**: set root EBS to at least 8 GiB, `Delete on termination = true`, `Encrypted = true` (recommended).
11. **Advanced options**: set shutdown behavior to `terminate` (recommended for ASG instances), and enable monitoring if desired.
12. Click **Create launch template**.

> **Tip:** keep the launch template minimal and bake larger configuration into AMIs where possible (immutable infrastructure approach).

### CLI example (illustrative — change placeholders)

```bash
aws ec2 create-launch-template \
 --launch-template-name asg-web-launch-template \
 --version-description "v1" \
 --launch-template-data '{
   "ImageId":"ami-0123456789abcdef0",
   "InstanceType":"t3.micro",
   "KeyName":"my-key",
   "SecurityGroupIds":["sg-0abc123def"],
   "IamInstanceProfile":{"Name":"AutoScale-InstanceRole"},
   "UserData":"'$(echo -n "#!/bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd" | base64 -w0)'",
   "BlockDeviceMappings":[{"DeviceName":"/dev/xvda","Ebs":{"VolumeSize":8,"VolumeType":"gp3","DeleteOnTermination":true,"Encrypted":true}}]
 }
'
```

---

## 2) Task 2 — Set Up Auto Scaling Group (ASG)

**Goal:** Create an ASG that uses your Launch Template and distributes instances across AZs.

### Console steps

1. Console → **EC2** → left nav → **Auto Scaling Groups**.
2. Click **Create Auto Scaling group**.
3. **Choose launch template** → select your `asg-web-launch-template` and version (latest stable).
4. **Auto Scaling group name**: `asg-web-prod` (use environment tag: `Environment=dev`)
5. **Network**: choose the VPC and at least two subnets in different AZs for high availability.
6. **Group size**: set **Desired = 1**, **Min = 1**, **Max = 3** (adjust for your test goals). For production set these after capacity planning.
7. **Load balancing**: if you already created a target group / ALB, select the target group; otherwise skip and attach the ALB after creating it (Task 4).
8. **Health checks**: choose **ELB** (if using ALB) and set a healthy threshold / grace period (e.g., 300 seconds) to allow user data to complete.
9. **Scaling policies**: skip now and configure policies in Task 3 (or add simple policies here).
10. **Advanced options**: configure instance protection, instance warm-up (e.g., 120 seconds), lifecycle hooks if you need to run actions during scale-in/out.
11. **Tags**: add tags and check `Propagate to instances` for relevant tags such as `Name`, `Project`, `Owner`.
12. Review and create.

### CLI example (illustrative)

```bash
aws autoscaling create-auto-scaling-group \
 --auto-scaling-group-name asg-web-prod \
 --launch-template LaunchTemplateName=asg-web-launch-template,Version=1 \
 --min-size 1 --max-size 3 --desired-capacity 1 \
 --vpc-zone-identifier "subnet-0aaaa,subnet-0bbbb"
```

---

## 3) Task 3 — Configure Scaling Policies

**Goal:** Configure automatic increase/decrease in instance count using sensible policies. Two recommended approaches:

### Option A — Target tracking (recommended for simplicity)

* Use a predefined metric (e.g., ASG average CPU or ALB RequestCount per target) and set a target value.
* Example: `Target tracking: ASGAverageCPUUtilization` with **Target value = 50%**.

**Console steps**

1. Open your Auto Scaling Group → **Automatic scaling** → **Create scaling policy**.
2. Choose **Target tracking policy**.
3. Select the predefined metric `ASGAverageCPUUtilization` (or choose `ALBRequestCountPerTarget` for request-based scaling).
4. Set **Target value** to e.g. 50.0.
5. Optionally enable scale-in (recommended) and set cooldown/instance warm up appropriately.
6. Save policy.

**CLI example**

```bash
aws autoscaling put-scaling-policy \
 --auto-scaling-group-name asg-web-prod \
 --policy-name cpu-target-tracking \
 --policy-type TargetTrackingScaling \
 --target-tracking-configuration '{"PredefinedMetricSpecification":{"PredefinedMetricType":"ASGAverageCPUUtilization"},"TargetValue":50.0}'
```

### Option B — Step scaling with CloudWatch Alarms (fine-grained control)

* Create CloudWatch alarms (e.g., CPU > 60 for 2 consecutive periods of 1 minute) and attach scale-out policy to alarm, and a scale-in policy to a lower threshold.

**High‑level steps**

1. Create `PutMetricAlarm` for CPUHigh.
2. Create scaling policy `StepScaling` that adds e.g. +1 instance when alarm triggers.
3. Create CPULow alarm and a scale‑in policy.

**Why choose one over the other?**

* **Target tracking**: simpler; AWS keeps metric close to target value.
* **Step scaling**: more control for multi‑step responses (e.g., add 2 instances if CPU > 80).

---

## 4) Task 4 — Attach ALB to Auto Scaling Group

**Goal:** Create or reuse an ALB and target group and ensure ASG registers instances with the target group so ALB routes traffic to instances.

### Steps to create ALB + target group (console)

1. **Create target group**: Console → EC2 → Load Balancing → Target Groups → Create target group

   * Target type: `instance` (or `ip` if required)
   * Protocol: HTTP, Port: 80
   * VPC: select your VPC
   * Health check: HTTP `/` or `/health` and success codes `200`.
   * Create target group.

2. **Create ALB**: Console → Load Balancers → Create Load Balancer → Application Load Balancer

   * Scheme: `internet-facing` (if public)
   * Listeners: HTTP 80 (or HTTPS 443 if you configure ACM)
   * Availability Zones: select same subnets used by ASG
   * Security group: allow inbound 80/443 from public
   * Default action: forward to the target group created earlier
   * Create ALB.

3. **Attach target group to ASG**

   * Go to ASG → **Edit** → **Load balancing** → Add **Target group** → select the target group created.
   * Save.

### CLI examples (illustrative)

```bash
# create target group
aws elbv2 create-target-group --name asg-web-tg --protocol HTTP --port 80 --vpc-id vpc-012345 --health-check-protocol HTTP --health-check-path / --matcher HttpCode=200

# create ALB
aws elbv2 create-load-balancer --name asg-web-alb --subnets subnet-aaa subnet-bbb --security-groups sg-xxxxxxx --scheme internet-facing

# create listener
aws elbv2 create-listener --load-balancer-arn <alb-arn> --protocol HTTP --port 80 --default-actions Type=forward,TargetGroupArn=<tg-arn>

# attach TG to ASG (update ASG)
aws autoscaling update-auto-scaling-group --auto-scaling-group-name asg-web-prod --target-group-arns <tg-arn>
```

> **Important:** set ALB health check path to a route served by your user data or application (i.e., `/` returns 200). Configure health check interval and healthy/unhealthy thresholds so instances have time to initialize.

---

## 5) Task 5 — Test Auto Scaling

**Goal:** Trigger the scaling policies and verify the ASG adjusts instance count. Monitor via console and CloudWatch.

### Two test approaches

**A. CPU-based scaling test** (if your scaling policy uses CPU)

1. SSH or SSM into the running instance behind the ALB.
2. Install `stress` and create load (commands for Amazon Linux):

```bash
sudo amazon-linux-extras install epel -y
sudo yum install stress -y
# create CPU load on 4 cores
stress -c 4
```

3. Monitor ASG and CloudWatch metrics — you should see CPU rise and, if above threshold, ASG add instances.

**B. HTTP request based scaling test** (if using ALB request count metric)

1. From a separate instance or local machine run a load generator (ApacheBench `ab`, `hey`, `wrk`). Example using `ab`:

```bash
ab -n 20000 -c 200 http://<ALB-DNS>/
```

2. Monitor the ALB Target Group → Target health and ASG → Instances to see new instances join.

### Verify scaling events

* Check **Auto Scaling** → **Activity history** to see scale‑out/scale‑in events.
* Check **Target Groups** to ensure new instances register and are healthy.
* Check **CloudWatch** for metrics used by policies (CPU, RequestCount, Latency).
* Check ALB access logs (if enabled) for request distribution.

---

## Validation checklist (quick)

* [ ] Launch Template created with correct AMI, user data, IAM instance role.
* [ ] ASG created with minimum, desired and maximum capacity set.
* [ ] ALB and target group created, ALB listeners configured.
* [ ] ASG attached to target group and health checks pass for newly launched instances.
* [ ] Scaling policy configured and CloudWatch alarms (if any) created.
* [ ] Testing performed and ASG scales in/out as expected.

---

## Cleanup (console or CLI)

**When finished, delete resources to avoid charges:**

* Delete Auto Scaling Group (set desired capacity to 0 then delete).
* Delete Launch Template.
* Delete Load Balancer, Listeners, Target Group.
* Delete Security Groups created for this lab example (if not used elsewhere).
* Delete IAM instance profile / role if created for the lab.

CLI quick delete hints (use with care):

```bash
aws autoscaling delete-auto-scaling-group --auto-scaling-group-name asg-web-prod --force-delete
aws ec2 delete-launch-template --launch-template-name asg-web-launch-template
# delete alb/listener/tg via elbv2 commands (retrieve ARNs first)
```

---

## Best practices — align to AWS Well‑Architected Framework

**Operational excellence**

* Automate everything: use Infrastructure as Code (CloudFormation/Terraform) for repeatability.
* Use launch template versions and CI to push new AMIs/config changes.
* Centralize logs in CloudWatch and create runbooks for common alarms.

**Security**

* Principle of least privilege: create an instance role with only required managed policies.
* Use SSM Session Manager instead of SSH where possible to avoid key management.
* Always use HTTPS in production (ALB + ACM certificates) and restrict security group rules.
* Enable ALB access logs to an S3 bucket with encryption (SSE‑KMS).

**Reliability**

* Deploy across multiple AZs (at least 2) so the ALB and ASG can survive AZ failure.
* Configure health checks and instance warm‑up to avoid flapping.
* Add lifecycle hooks to gracefully drain connections during instance termination.

**Performance Efficiency**

* Use appropriate scaling metrics: use ALB RequestCountPerTarget for request-driven apps, CPU for compute-bound tasks.
* Right-size instances and consider spot instances for cost-sensitive workloads with capacity fallback.

**Cost optimization**

* Set sensible `max` capacity and use budget alarms (AWS Budgets) to detect runaway scale.
* Consider using Savings Plans or Reserved Instances for steady baseline capacity.

**Observability**

* Emit application metrics to CloudWatch and create dashboards.
* Enable CloudTrail for API auditing and AWS Config for resource compliance.

**Naming & tagging**

* Tag resources consistently: `Project`, `Environment`, `Owner`, `CostCenter`. Use tags to manage cost and automation.

---

