# AWS Security Groups & NACLs: Network Security Fundamentals

## Table of Contents
1. Overview
2. Core Concepts & Theoretical Foundation
3. Implementation Guide
4. Scenario Analysis
5. Common Issues & Troubleshooting
6. Security Best Practices
7. Project Reflection
8. Additional Resources

## Overview
This project provides an in-depth exploration of AWS network security fundamentals through Security Groups and Network Access Control Lists (NACLs). Through practical demonstrations and scenario-based learning, you'll understand how to implement layered security controls within AWS VPC environments.

Project Duration: 2 hours

## Core Concepts & Theoretical Foundation

### Security Groups (Instance-Level Firewall)
**Definition:** Security Groups act as stateful virtual firewalls at the instance level, controlling traffic to AWS resources like EC2 instances.

#### Key Characteristics:
- **Stateful:** Automatically allow return traffic for established connections
- **Allow Rules Only:** Cannot explicitly deny traffic (only allow or implicit deny)
- **Instance-Level:** Applied to individual AWS resources
- **Evaluated First:** Traffic must pass Security Group rules before NACL evaluation

#### Components:
- **Inbound Rules:** Control incoming traffic to instances
- **Outbound Rules:** Control outgoing traffic from instances
- **Protocol/Port Based:** Rules specify protocols (TCP, UDP, ICMP) and port numbers
- **Source/Destination:** Defined by IP ranges (CIDR blocks) or other security groups

### Network Access Control Lists (Subnet-Level Firewall)
**Definition:** NACLs act as stateless network firewalls at the subnet level, providing an additional layer of security.

#### Key Characteristics:
- **Stateless:** Require explicit rules for both inbound and outbound traffic
- **Allow/Deny Rules:** Can explicitly allow or deny specific traffic
- **Subnet-Level:** Applied to entire subnets
- **Rule Numbering:** Rules are evaluated in order (lowest number first)
- **First Line of Defense:** Traffic hits NACL before reaching Security Groups

#### Components:
- **Inbound Rules:** Control traffic entering the subnet
- **Outbound Rules:** Control traffic leaving the subnet
- **Rule Number:** Determines evaluation order (1-32766)
- **Protocol:** TCP, UDP, ICMP, or custom
- **CIDR Blocks:** Source/destination IP ranges

## Comparison: Security Groups vs. NACLs

|Aspect	                           | Security Groups	           | NACLs                      |
|----------------------------------|-----------------------------|----------------------------|
| Scope	                           | Instance level	             | Subnet level               |
| State	                           | Stateful	                   | Stateless                  |
| Rule Types	                     | Allow only	                 | Allow + Deny               |
| Evaluation	                     | All rules evaluated	       | Rules evaluated in order   |
| Default Behavior	               | Implicit deny all inbound, allow all outbound	| Default NACL: allow all in/out  |
| Association	                     | Multiple groups per instance	          | One NACL per subnet    |


## Implementation Guide
1. Security Group Configuration
Creating a Security Group:
  1. Navigate to VPC > Security Groups in AWS Console
  2. Click "Create Security Group"
  3. Select the appropriate VPC
  4. Configure inbound rules (e.g., HTTP port 80, SSH port 22)
  5. Configure outbound rules (typically allow all for web servers)
  6. Click "Create Security Group"

-![createsecuritygroup.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Security_Groups_%26_NACLs/Screenshot/createsecuritygroup.png)

-![createsecuritygroup1.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Security_Groups_%26_NACLs/Screenshot/createsecuritygroup1.png)

-![createsecuritygroup2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Security_Groups_%26_NACLs/Screenshot/createsecuritygroup2.png)

-![createsecuritygroup3.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Security_Groups_%26_NACLs/Screenshot/createsecuritygroup3.png)

-![createsecuritygroup4.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Security_Groups_%26_NACLs/Screenshot/createsecuritygroup4.png)

-![createsecuritygroup5.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Security_Groups_%26_NACLs/Screenshot/createsecuritygroup5.png)

-![editinboundrule.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Security_Groups_%26_NACLs/Screenshot/editinboundrule.png)


Attaching to EC2 Instance:
  1. Select your EC2 instance
  2. Actions > Security > Change Security Groups
  3. Add the new security group
  4. Save changes




2. NACL Configuration
Creating a NACL:
  1. Navigate to VPC > Network ACLs
  2. Click "Create Network ACL"
  3. Select the appropriate VPC
  4. Click "Create"




Configuring Rules:
  1. Select your NACL
  2. Edit inbound rules:
    * Add rules with appropriate rule numbers
    * Specify type (HTTP, SSH, etc.)
    * Set source CIDR (0.0.0.0/0 for public access)
    * Allow/deny selection
  3. Edit outbound rules (must explicitly allow return traffic)
  4. Save changes





Associating with Subnet:
  1. Select your NACL
  2. Actions > Edit subnet associations
  3. Select the appropriate subnet
  4. Save changes





## Scenario Analysis
The project explored several configurations to understand interaction between Security Groups and NACLs:

### Scenario 1: NACL Allows All, Security Group Denies All
- NACL: Allows all inbound/outbound traffic
- Security Group: Denies all inbound/outbound traffic
- Outcome: Website access blocked
- Reason: Security Group denies traffic after NACL allows it

### Scenario 2: NACL Denies All, Security Group Allows All
- NACL: Denies all inbound/outbound traffic
- Security Group: Allows all inbound/outbound traffic
- Outcome: Website access blocked
- Reason: NACL denies traffic before it reaches Security Group

Scenario 3: Mixed Permissions with HTTP
- NACL: Allows HTTP inbound, denies outbound
- Security Group: Allows inbound, denies outbound
- Outcome: Website access allowed but functionality impaired
- Reason: Inbound request reaches instance, but response blocked

Scenario 4: NACL Allows All, Security Group Allows HTTP In/Denies Out
- NACL: Allows all inbound/outbound
- Security Group: Allows HTTP inbound, denies outbound
- Outcome: Website accessible but impaired functionality
- Reason: Security Group statefulness allows return traffic despite outbound deny rule

Scenario 5: Both Allow All
- NACL: Allows all inbound/outbound
- Security Group: Allows all inbound/outbound
- Outcome: Website access allowed
- Reason: No restrictions at either layer

Scenario 6: NACL Denies All, Security Group Allows HTTP In/Denies Out
- NACL: Denies all inbound/outbound
- Security Group: Allows HTTP inbound, denies outbound
- Outcome: Website access blocked
- Reason: NACL denies traffic before it reaches Security Group

## Common Issues & Troubleshooting
1. Website Inaccessible Despite Security Group Allow Rules
Problem: HTTP/HTTPS traffic not reaching instance despite Security Group configuration

Potential Causes:
- NACL blocking traffic at subnet level
- Incorrect Security Group attached to instance
- Missing outbound rules in NACL (stateless nature)

Solutions:
- Verify NACL inbound/outbound rules allow HTTP/HTTPS traffic
- Check Security Group association with instance
- Ensure NACL has explicit outbound rules for return traffic

2. SSH/RDP Access Issues
Problem: Cannot connect to instance via SSH/RDP

Potential Causes:
- Security Group missing allow rule for SSH/RDP
- NACL blocking port 22 (SSH) or 3389 (RDP)
- Instance not in public subnet with Internet Gateway

Solutions:
- Add Security Group rule allowing SSH/RDP from your IP
- Check NACL rules for SSH/RDP ports
- Verify route table has route to Internet Gateway

3. Intermittent Connectivity Issues
Problem: Connection works initially but drops

Potential Causes:
- NACL stateless nature blocking return traffic
- Ephemeral port restrictions

Solutions:
- Ensure NACL outbound rules allow traffic on ephemeral ports (1024-65535)
- Add broad outbound allow rule for established connections

4. Security Group Rule Not Working
Problem: Specific rule not having expected effect

Potential Causes:
- Rule conflict (especially in NACLs with numbering)
- Incorrect CIDR notation
- Protocol/port mismatch

Solutions:
- Check rule order in NACLs (lower numbers evaluated first)
- Verify CIDR blocks (e.g., 0.0.0.0/0 for all IPv4)
- Confirm correct protocol/port combinations

5. NACL Association Issues
Problem: NACL changes not taking effect

Potential Causes:
- NACL not associated with correct subnet
- Multiple NACLs affecting traffic path

Solutions:
- Verify NACL-subnet association
- Check for route table conflicts
- Review VPC flow logs for traffic analysis

## Security Best Practices

1. Principle of Least Privilege
  - Restrict Security Group rules to specific IP ranges where possible
  - Use specific port ranges instead of broad allowances
  - Regularly audit and remove unnecessary rules

2. Layered Security Defense
  - Implement both Security Groups and NACLs for defense in depth
  - Use Security Groups for instance-level protection
  - Use NACLs for subnet-level network segmentation

3. NACL Rule Ordering
  - Place deny rules with lower numbers than allow rules
  - Use incremental numbering (e.g., 100, 200, 300) for easier management
  - Include explicit deny all rule at end (highest number)

4. Monitoring and Logging
  - Enable VPC Flow Logs to monitor traffic patterns
  - Use AWS Config to track configuration changes
  - Implement CloudWatch alerts for security events

5. Regular Audits
- Periodically review Security Group and NACL rules
- Remove unused security groups and NACLs
- Validate rules against current business requirements

## Project Reflection
This hands-on project provided valuable insights into AWS network security fundamentals:

### Key Learnings:
1. Practical Understanding: Gained hands-on experience configuring Security Groups and NACLs
2. Interaction Patterns: Understood how different security layers interact in traffic flow
3. Troubleshooting Skills: Developed techniques for diagnosing network connectivity issues
4. Security Principles: Reinforced concepts of least privilege and defense in depth

### Technical Insights:
- Security Groups are stateful, automatically allowing return traffic
- NACLs are stateless, requiring explicit inbound and outbound rules
- Rule evaluation order matters significantly in NACLs
- Proper configuration requires understanding of both components

## Real-World Application:
These skills are directly applicable to securing production AWS environments, ensuring proper network segmentation, and implementing effective security controls for various application architectures.

## Additional Resources
- [AWS Security Groups Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)
- [AWS NACLs Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html)
- [VPC Flow Logs Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html)
- [AWS Well-Architected Framework Security Pillar](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html)
- [AWS Network Security Best Practices](https://docs.aws.amazon.com/whitepapers/latest/best-practices-for-ddos-resiliency/best-practices-for-network-security.html)
