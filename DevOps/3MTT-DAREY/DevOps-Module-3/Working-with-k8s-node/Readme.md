# 🧩 Working with Kubernetes Nodes

## 📘 Overview

This project introduces you to **Kubernetes Nodes**, the core worker components of a Kubernetes cluster, and demonstrates how to manage them using **Minikube**.  
By the end of this project, you will understand how to **create, inspect, and maintain nodes**, as well as simulate real-world Kubernetes operations within a **local development environment**.

---

## 🎯 Learning Objectives

| Objective | Description | Status |
|------------|--------------|---------|
| Understand Kubernetes Node architecture | Learn what nodes are and their role in a cluster | ✅ |
| Start, stop, and delete a Minikube cluster | Manage lifecycle of local Kubernetes clusters | ✅ |
| View and inspect nodes | Retrieve and analyze node configuration and health | ✅ |
| Understand node scaling and maintenance | Learn how node scaling and upgrades work conceptually | ✅ |
| Demonstrate verification and troubleshooting | Practice command-line validation techniques | ✅ |

---

## ⚙️ 1. What is a Kubernetes Node?

A **Node** in Kubernetes is the **worker machine** (physical or virtual) that runs application **Pods** and manages **containers**.  
Nodes collectively form the Kubernetes cluster’s computing layer.  

Each Node typically includes:
- **Kubelet:** Communicates with the control plane and manages pods.
- **Container runtime:** Runs containers (e.g., Docker or containerd).
- **Kube-proxy:** Manages networking rules for pod communication.

> 🧠 Think of each node as an employee in a company — responsible for executing assigned tasks (containers) efficiently and reporting back to management (the control plane).

---

## 🧰 2. Prerequisites

Before starting, ensure that:
- Minikube is installed → [Install Guide](https://minikube.sigs.k8s.io/docs/start/)
- Kubectl is configured → Verify using `kubectl version`
- Virtualization is enabled (e.g., VirtualBox, Docker, or Hyper-V backend)

---

## 🚀 3. Managing Nodes in Kubernetes

Minikube provides a lightweight local Kubernetes cluster — ideal for **development, testing, and experimentation**.  
The following steps guide you through **starting**, **stopping**, **deleting**, and **inspecting** your Minikube cluster.

---

### 🟢 Step 1: Start the Minikube Cluster

```bash
minikube start
```

Explanation:

Provisions a single-node Kubernetes cluster.

Starts a VM or container that hosts the control-plane and worker node.

Example Output:

Starting control plane node minikube in cluster minikube
Creating virtualbox VM...
Done! kubectl is now configured to use "minikube" cluster


Verification Command:

kubectl get nodes


Expected Output:

NAME       STATUS   ROLES           AGE     VERSION
minikube   Ready    control-plane   2m      v1.28.3

🔴 Step 2: Stop the Cluster
minikube stop


Explanation:

Stops the running Minikube VM but preserves cluster state (data, images, configurations).

Useful for saving system resources.

Verification:

minikube status


Output should indicate that the cluster is stopped.

⚫ Step 3: Delete the Cluster
minikube delete


Explanation:

Permanently deletes all cluster resources (VMs, configurations, volumes).

Use this command to reset your environment or reclaim storage.

🔍 Step 4: View Nodes
kubectl get nodes


Purpose: Lists all active nodes in your cluster.

Expected Output:

NAME       STATUS   ROLES           AGE     VERSION
minikube   Ready    control-plane   24m     v1.28.3

🧾 Step 5: Inspect Node Details
kubectl describe node <node-name>


Example:

kubectl describe node minikube


Key Fields Explained:

Field	Description
Roles	Specifies the node’s purpose (e.g., control-plane, worker).
Labels	Metadata used by Kubernetes for scheduling.
Taints	Define node conditions for pod scheduling.
Capacity	CPU and memory resources available.
Allocatable	Resources available for pods after system overhead.

Partial Output Example:

Name:               minikube
Roles:              control-plane
Labels:             kubernetes.io/hostname=minikube
Capacity:           cpu: 2, memory: 2Gi
Allocatable:        cpu: 2, memory: 1.8Gi
Taints:             <none>
Unschedulable:      false

⚖️ 4. Node Scaling and Maintenance

Although Minikube runs a single-node cluster, understanding scaling concepts is critical for production Kubernetes environments.

Node Scaling

Horizontal scaling: Add or remove worker nodes to balance workload.

In Minikube, this is simulated through resource allocation rather than actual node addition.

Node Upgrade
minikube update


Upgrades your local cluster to a newer Kubernetes version, keeping your local development aligned with the production environment.

🧪 5. Verification and Evidence
Step	Command	Expected Output
Start cluster	minikube start	Cluster starts successfully
Check node status	kubectl get nodes	Node shows “Ready”
Inspect node	kubectl describe node minikube	Detailed metadata displayed
Stop cluster	minikube stop	Cluster stopped gracefully
Delete cluster	minikube delete	Cluster resources removed

📸 Screenshots to Include for Submission:

kubectl get nodes showing node status = Ready

kubectl describe node minikube with metadata and labels

Terminal output of minikube start and minikube stop

Optional: Minikube dashboard view (minikube dashboard)

🧠 6. Troubleshooting Guide
Issue	Possible Cause	Solution
Minikube fails to start	Virtualization not enabled	Enable virtualization in BIOS or switch to Docker driver
Node status = NotReady	Networking issue or kubelet failure	Restart with minikube stop && minikube start
“kubectl command not found”	Kubectl not installed	Install via: sudo snap install kubectl --classic
Slow startup	Limited system resources	Increase VM CPU/memory using minikube config
Deletion error	Stuck VM process	Use minikube delete --all --purge
🧩 7. Summary of Key Learnings

Kubernetes Nodes are the backbone of any cluster, hosting and running workloads (Pods).

Minikube allows you to simulate a full Kubernetes environment on your local machine.

You can start, stop, delete, and inspect clusters easily with CLI commands.

Understanding scaling and maintenance prepares you for real-world, production-level Kubernetes administration.

🧾 8. Deliverables Checklist
Deliverable	Description	Status
minikube start output	Shows cluster initialization success	✅
kubectl get nodes screenshot	Lists nodes with “Ready” status	✅
kubectl describe node screenshot	Displays node details	✅
Summary reflection	Short write-up on learnings	✅
Troubleshooting table	Documents potential issues and fixes	✅
🧭 9. Reflection

Working with Kubernetes nodes in Minikube helped me understand the foundational structure of container orchestration.
I learned how nodes host workloads, manage system resources, and communicate within a cluster.
This hands-on experience prepares me for scaling, debugging, and managing Kubernetes deployments in production environments.

Author: Abraham Aigbokhan
Project: Working with Kubernetes Nodes
Platform: Minikube + Kubectl
Date: October 2025
Cluster Type: Single-node (local development)
