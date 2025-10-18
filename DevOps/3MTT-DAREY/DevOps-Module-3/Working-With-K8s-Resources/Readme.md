
# 🧱 Working with Kubernetes Resources — Complete Project

## 📘 Overview

This project provides a **comprehensive, beginner-friendly introduction** to managing Kubernetes resources using **Minikube**.  
You will learn how to:
- Understand YAML syntax.
- Create and manage **Deployments** and **Services**.
- Deploy and expose an NGINX application on a local Minikube cluster.

The goal is to develop hands-on proficiency in writing and applying YAML configuration files to define, deploy, and manage Kubernetes workloads.

---

## 🎯 Learning Objectives

| Objective | Description | Status |
|------------|-------------|---------|
| Understand YAML structure and syntax | Learn indentation, data types, and key-value mapping | ✅ Completed |
| Create and apply Deployments in Kubernetes | Deploy an application using YAML | ✅ Completed |
| Expose a Deployment via a Service | Create a Service using NodePort for external access | ✅ Completed |
| Verify and access the deployed application | Confirm deployment using commands and browser access | ✅ Completed |
| Document outputs and troubleshooting steps | Provide screenshots and verification logs | ✅ Completed |

---

## ⚙️ 1. Introduction to YAML

A **Kubernetes YAML file** defines resources and their configurations in a **declarative format**.  
YAML stands for *YAML Ain’t Markup Language* and uses **indentation** to represent data hierarchy.

### 📄 Example Structure

```yaml
key1: value1
key2:
  subkey1: subvalue1
  subkey2: subvalue2
key3:
  - item1
  - item2
```

📘 YAML Data Types
Scalars (Strings, Numbers, Booleans)

```yaml
name: John Doe
age: 25
is_student: true
```

Lists (Arrays)

```yaml
fruits:
  - apple
  - banana
  - orange
```

Maps (Key-Value Pairs)

```yaml
person:
  name: Alice
  age: 30
```

Nested Structures

```yaml
employee:
  name: John Doe
  position: Developer
  skills:
    - Python
    - JavaScript
```

Comments

```yaml
# This is a comment
key: value
```

Multiline Strings

```yaml
description: |
  This is a multiline
  string in YAML.
```

Anchors & Aliases

```yaml
first: &name John
second: *name
```

## 🚀 2. Deploying Applications in Kubernetes

Kubernetes deployments define how applications are rolled out and maintained.
You will learn how to:

Create a Deployment (application blueprint)

Expose it using a Service (for network access)

## 🧩 3. Deployments and Services in Kubernetes

🧠 Deployment
A Deployment manages replicas of your application Pods.
It ensures your application runs continuously and can self-heal.

🌐 Service
A Service provides stable network access to Pods.

Service Type	Purpose	Accessibility
ClusterIP	Default	Internal only
NodePort	Fixed port per node	External access
LoadBalancer	Uses cloud LB	External with public IP

🧱 4. Deploying a Sample Application on Minikube
Let’s deploy and expose a sample echo-server application.

Step 1: Create Deployment
bash
Copy code
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
Expected Output:

bash
Copy code
deployment.apps/hello-minikube created
📸 Screenshot Required:
Show terminal with the successful creation of hello-minikube.

Step 2: Expose Deployment via NodePort
bash
Copy code
kubectl expose deployment hello-minikube --type=NodePort --port=8080
Expected Output:

bash
Copy code
service/hello-minikube exposed
📸 Screenshot Required:
Capture confirmation that the Service has been exposed.

Step 3: View Services
bash
Copy code
kubectl get services hello-minikube
Expected Output:

pgsql
Copy code
NAME             TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
hello-minikube   NodePort   10.111.93.87    <none>        8080:32654/TCP   15s
📸 Screenshot Required:
Include terminal output of service listing with assigned NodePort.

Step 4: Access the Service via Browser
bash
Copy code
minikube service hello-minikube --url
Example Output:

cpp
Copy code
http://127.0.0.1:55077
Open this URL in your browser — you should see an echo response confirming successful deployment.

📸 Screenshot Required:
Show browser window displaying application response and terminal command output.

🧰 5. Working with YAML Files for Custom Deployments
Let’s create and deploy your own NGINX application using YAML configuration files.

Step 1: Folder Structure
perl
Copy code
my-nginx-yaml/
├── nginx-deployment.yaml
└── nginx-service.yaml
Step 2: NGINX Deployment File
Create nginx-deployment.yaml:

yaml
Copy code
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-nginx-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: my-nginx
  template:
    metadata:
      labels:
        app: my-nginx
    spec:
      containers:
        - name: my-nginx
          image: dareregistry/my-nginx:1.0
          ports:
            - containerPort: 80
📘 Explanation:

replicas: Number of Pod instances

image: Your Docker image (replace with your image if different)

ports: Exposes container port 80 for web access

Step 3: NGINX Service File
Create nginx-service.yaml:

yaml
Copy code
apiVersion: v1
kind: Service
metadata:
  name: my-nginx-service
spec:
  selector:
    app: my-nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: NodePort
📘 Explanation:

selector: Matches Pods with label app: my-nginx

type: NodePort: Makes it externally accessible via a fixed port

Step 4: Apply YAML Files
bash
Copy code
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
Expected Output:

bash
Copy code
deployment.apps/my-nginx-deployment created
service/my-nginx-service created
📸 Screenshot Required:
Include output of both apply commands showing “created”.

Step 5: Verify Deployment and Service
bash
Copy code
kubectl get deployments
kubectl get services
Example Output:

pgsql
Copy code
NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
my-nginx-deployment     1/1     1            1           4m40s

NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes           ClusterIP   10.96.0.1        <none>        443/TCP        16m
my-nginx-service     NodePort    10.111.164.164   <none>        80:31241/TCP   4m41s
📸 Screenshot Required:
Capture the terminal output confirming deployment readiness and service exposure.

Step 6: Access the Application
bash
Copy code
minikube service my-nginx-service --url
Example Output:

cpp
Copy code
http://127.0.0.1:55077
Open the provided URL in your web browser to access your running NGINX web server.

📸 Screenshot Required:
Include both the terminal output and a browser screenshot displaying the NGINX welcome page.

🧾 6. Deliverables Checklist
Deliverable	Description	Status	Evidence
YAML Structure Understanding	Demonstrate YAML basics with examples	✅	Screenshot 1
Create Deployment	hello-minikube and my-nginx-deployment	✅	Screenshot 2
Expose Deployment as Service	Using kubectl expose and YAML Service	✅	Screenshot 3
Verify Deployments and Services	Confirm with kubectl get commands	✅	Screenshot 4
Access Deployed App	Use minikube service --url and browser	✅	Screenshot 5

🧰 7. Troubleshooting Guide
Issue	Possible Cause	Solution
Pods stuck in ContainerCreating	Slow image pull or network issue	Check kubectl describe pod for logs
Service not accessible	Port blocked or Service misconfigured	Ensure correct NodePort and open firewall rules
YAML syntax error	Incorrect indentation	Validate YAML with yamllint or VS Code YAML plugin
Image not found	Wrong Docker image name	Verify image on Docker Hub or your registry
Browser not loading app	Service type incorrect	Use NodePort or run minikube service command

🧠 8. Summary of Key Learnings
YAML files define desired state of Kubernetes objects.

Deployments manage Pods and ensure consistent application state.

Services provide networking and stable access points for applications.

You successfully deployed and exposed an NGINX web app using YAML.

The Minikube environment simulates real-world Kubernetes workflows locally.

🧭 9. Reflection
This project enhanced my understanding of how Kubernetes resources are defined and managed through YAML.
I learned the full lifecycle of deploying an application — from writing YAML files to verifying and accessing it through a web browser.
The clear separation of Deployments and Services demonstrates how Kubernetes provides abstraction, scalability, and resilience for containerized applications.

📷 10. Evidence Summary
Screenshot #	Description
1	YAML syntax and structure examples
2	Successful creation of Deployment (hello-minikube)
3	Exposure of Deployment as NodePort Service
4	Verification of Deployment and Service status
5	Browser access showing NGINX welcome page

🔗 11. References
Kubernetes Official Documentation

Minikube Documentation

Kubectl Cheat Sheet

Kubernetes Services and Networking

YAML Official Guide

## Author: Abraham Aigbokhan
Project Title: Working with Kubernetes Resources
Platform: Minikube + Kubectl
Date: October 2025
Cluster Type: Single-Node (Development Environment)
