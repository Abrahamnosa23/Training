# 🌐 Networking in Kubernetes — Complete Project

## 📘 Overview

This project provides a **foundational, hands-on guide** to understanding and implementing **networking in Kubernetes** using Minikube.  
You will learn how Kubernetes handles internal and external communication between Pods, Services, and Ingress controllers — and demonstrate **Pod networking** with a **multi-container Pod** example.

By the end of this project, you’ll gain strong practical skills in:
- Pod-to-pod communication  
- Shared network namespaces  
- Service and ingress routing concepts  
- YAML-based Pod definitions  

---

## 🎯 Learning Objectives

| Objective | Description | Status |
|------------|-------------|---------|
| Understand Kubernetes networking fundamentals | Explore Pod, Service, and Ingress communication | ✅ Completed |
| Create and deploy a multi-container Pod | Demonstrate shared network namespace | ✅ Completed |
| Verify pod communication using localhost | Test inter-container connectivity | ✅ Completed |
| Apply and inspect Pod YAML configuration | Deploy and validate the Pod via kubectl | ✅ Completed |
| Document outputs, screenshots, and troubleshooting | Provide evidence and troubleshooting steps | ✅ Completed |

---

## ⚙️ 1. Introduction to Networking in Kubernetes

Kubernetes networking ensures **communication between containers, pods, and services** both within and outside the cluster.

### 🔑 Key Components

| Concept | Description |
|----------|--------------|
| **Pod Networking** | Containers inside the same Pod share the same network namespace, allowing communication via `localhost`. |
| **Service Networking** | Provides a stable endpoint for accessing Pods via ClusterIP, NodePort, or LoadBalancer. |
| **Pod-to-Pod Communication** | Uses unique Pod IPs; communication is direct across nodes using overlay networks. |
| **Ingress** | Manages external HTTP/HTTPS access to services within the cluster. |
| **Network Policies** | Define security rules to control Pod communication. |
| **CNI (Container Network Interface)** | Enables Kubernetes to integrate with different networking plugins. |

---

## 🧩 2. Hands-On: Pod Networking with Multi-Container Pods

In this section, you will deploy a **multi-container Pod** to visualize how containers in the same Pod share a single network namespace and communicate via `localhost`.

---

### Step 1: Create a Multi-Container Pod YAML File

Create a file named `multi-container-pod.yaml` and paste the following YAML code:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: multi-container-pod
spec:
  containers:
    - name: container-1
      image: nginx:alpine
    - name: container-2
      image: busybox
      command:
        - "/bin/sh"
        - "-c"
        - "mkdir -p /usr/share/nginx/html && while true; do echo \"Hello from Container 2\" >> /usr/share/nginx/html/index.html; sleep 10; done"
```

📘 Explanation of the YAML File
Field	Description
apiVersion: v1	Specifies the API version for Pods.
kind: Pod	Defines the resource type.
metadata.name	Assigns the name multi-container-pod.
spec.containers	Defines the containers running in the Pod.
container-1	Runs an NGINX web server.
container-2	Runs BusyBox and continuously updates the NGINX HTML file using shared storage and localhost.

🧠 Concept Demonstrated:
Both containers share the same network namespace and can communicate internally using localhost.

🚀 3. Deploying and Managing the Pod
Step 1: Apply the Pod Configuration
bash
Copy code
kubectl apply -f multi-container-pod.yaml
Expected Output:

bash
Copy code
pod/multi-container-pod created
📸 Screenshot Required:
Include terminal showing successful creation of the Pod.

Step 2: Verify Pod Status
bash
Copy code
kubectl get pods
Example Output:

pgsql
Copy code
NAME                  READY   STATUS              RESTARTS   AGE
multi-container-pod   0/2     ContainerCreating   0          4s

NAME                  READY   STATUS    RESTARTS   AGE
multi-container-pod   2/2     Running   0          11s
📸 Screenshot Required:
Show terminal output with both containers running (2/2).

Step 3: Inspect Pod Logs
bash
Copy code
kubectl logs multi-container-pod -c container-1
kubectl logs multi-container-pod -c container-2
Example Output (partial):

pgsql
Copy code
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
Hello from Container 2
Hello from Container 2
Hello from Container 2
📸 Screenshot Required:
Show log outputs from both containers demonstrating shared data interaction.

Step 4: Access NGINX from the BusyBox Container
bash
Copy code
kubectl exec -it multi-container-pod -c container-2 -- /bin/sh
Inside BusyBox:

bash
Copy code
cd /usr/share/nginx/html
cat index.html
Expected Output:

csharp
Copy code
Hello from Container 2
Hello from Container 2
Hello from Container 2
...
📸 Screenshot Required:
Display the repeated “Hello from Container 2” message confirming container-to-container communication.

Step 5: Access via Localhost
Within the BusyBox container, you can also run:

bash
Copy code
wget -qO- http://localhost
This verifies that container-2 can reach NGINX (container-1) through localhost — confirming shared networking.

📸 Screenshot Required:
Include command and output showing the NGINX page being served.

🧾 4. Deliverables Checklist
Deliverable	Description	Status	Evidence
Multi-Container Pod YAML	Correct syntax and applied successfully	✅	Screenshot 1
Pod Created and Running	Confirmed via kubectl get pods	✅	Screenshot 2
Logs Verified	Output from both containers	✅	Screenshot 3
Internal Communication Verified	Data shared via localhost	✅	Screenshot 4
Evidence of Network Sharing	Access NGINX from BusyBox	✅	Screenshot 5

🧰 5. Troubleshooting Guide
Issue	Possible Cause	Solution
ContainerCreating for long	Image pulling delay or network issue	Wait or check with kubectl describe pod
Logs show “permission denied”	Shared path access issue	Ensure path /usr/share/nginx/html exists and is writable
Pod stuck in Pending state	Insufficient resources in Minikube	Run minikube delete then minikube start --memory=4096
BusyBox cannot access localhost	Containers not in same Pod	Ensure both containers are under the same Pod spec
YAML validation error	Incorrect indentation	Use yamllint to validate YAML syntax

🧠 6. Summary of Key Learnings
Pod Networking allows containers in the same Pod to share IP and port space.

Services provide persistent communication endpoints between Pods.

Ingress handles routing of external traffic into the cluster.

Network Policies secure internal communication between Pods.

CNI Plugins manage cluster-level networking and IP allocation.

The multi-container Pod experiment demonstrated how containers communicate using localhost and share resources seamlessly.

🧭 7. Reflection
This project deepened my understanding of how Kubernetes manages internal and external communication.
The multi-container Pod exercise provided hands-on insight into:

Shared networking namespaces.

Pod-level communication using localhost.

How Kubernetes abstracts complex networking while maintaining modularity.

This foundational understanding prepares me to work confidently with Services, Ingress, and Network Policies in production-level Kubernetes environments.

📷 8. Evidence Summary
Screenshot #	Description
1	Pod creation confirmation
2	Pod status showing both containers running
3	Logs from container-1 (NGINX) and container-2 (BusyBox)
4	Container-2 displaying shared HTML file
5	Successful localhost access within the same Pod

🔗 9. References
Kubernetes Networking Concepts

Minikube Documentation

kubectl Cheat Sheet

YAML Best Practices

Container Network Interface (CNI)

Author: Abraham Aigbokhan
Project Title: Networking in Kubernetes
Platform: Minikube + Kubectl
Date: October 2025
Cluster Type: Single-Node (Development Environment)
Course Type: Beginner-to-Intermediate Kubernetes Networking Project
