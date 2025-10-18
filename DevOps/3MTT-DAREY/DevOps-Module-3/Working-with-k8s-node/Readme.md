# 🧩 Working with Kubernetes Nodes — Complete Project

## 📘 Overview

This project explores **Kubernetes Nodes** — the worker machines that execute containers in a Kubernetes cluster.  
Using **Minikube**, you will learn how to create, manage, inspect, and delete nodes, simulating real-world cluster operations in a local environment.  

This project aligns with the objectives of mastering **Kubernetes fundamentals**, **infrastructure automation**, and **container orchestration**.

---

## 🎯 Learning Objectives

| Objective | Description | Status |
|------------|--------------|---------|
| Understand Kubernetes Node architecture | Identify the role of nodes and their components in the cluster | ✅ Completed |
| Start, stop, and delete a Minikube cluster | Learn full lifecycle management of Kubernetes clusters | ✅ Completed |
| View and inspect nodes using `kubectl` | Retrieve configuration, roles, and capacity details | ✅ Completed |
| Simulate node scaling and maintenance | Understand upgrade and scaling concepts | ✅ Completed |
| Verify outputs and provide evidence | Include screenshots and terminal outputs for validation | ✅ Completed |

---

## ⚙️ 1. Understanding Kubernetes Nodes

A **Kubernetes Node** is a physical or virtual machine that hosts application containers and manages workloads within a cluster.  
Each node includes:

- **Kubelet:** Communicates with the control plane and ensures container health.  
- **Container Runtime:** Runs and manages containers (e.g., Docker or containerd).  
- **Kube-proxy:** Manages networking and routing between services and pods.  

> 🧠 Analogy: Nodes are like employees in an organization. Each node works independently but coordinates with others through a control plane to achieve a common objective — running your applications efficiently.

---

## 🧰 2. Prerequisites

Before beginning, ensure the following:

- **Minikube Installed:** [Install Minikube](https://minikube.sigs.k8s.io/docs/start/)
- **kubectl Installed:** Verify with `kubectl version --client`
- **Virtualization Enabled:** Required backend such as Docker, Hyper-V, or VirtualBox
- **Stable Internet Connection:** Needed for pulling Kubernetes and Docker images

---

## 🚀 3. Node Management in Kubernetes

### 🟢 Step 1: Start Minikube Cluster

```bash
minikube start
```


Explanation:
Starts a local single-node Kubernetes cluster running the control plane and worker node.

Example Output:

😄  minikube v1.32.0 on Ubuntu 22.04
✨  Using the docker driver
🏃  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
🌟  Done! kubectl is now configured to use "minikube" cluster and "default" namespace


Verification Command:

kubectl get nodes


Expected Output:

NAME       STATUS   ROLES           AGE     VERSION
minikube   Ready    control-plane   2m      v1.28.3


📸 Screenshot Required:

Screenshot of terminal showing successful minikube start and kubectl get nodes output.

🟠 Step 2: Stop the Cluster
minikube stop


Explanation:
Stops the Minikube cluster gracefully while preserving cluster data.

Example Output:

✋  Stopping node "minikube" ...
🛑  1 node stopped.


Verification:

minikube status


Expected Output:

minikube: Stopped


📸 Screenshot Required:

Capture minikube stop output confirming cluster shutdown.

🔴 Step 3: Delete the Cluster
minikube delete


Explanation:
Deletes the local Kubernetes cluster and all associated resources.

Example Output:

🔥  Deleting "minikube" in docker ...
💀  Removed all traces of the "minikube" cluster.


Verification:

minikube profile list


Expected Output:

No minikube profile found.


📸 Screenshot Required:

Capture successful deletion confirmation output.

🔍 Step 4: View Node Information
kubectl get nodes


Purpose: Displays all nodes and their statuses.

Example Output:

NAME       STATUS   ROLES           AGE     VERSION
minikube   Ready    control-plane   24m     v1.28.3

📋 Step 5: Inspect a Node in Detail
kubectl describe node minikube


Purpose: Provides detailed information about the node.

Key Fields:

Field	Description
Roles	Defines the node’s responsibilities (e.g., control-plane, worker).
Labels	Metadata used for node selection and scheduling.
Capacity	Total available CPU and memory.
Allocatable	Resources available for workloads after system overhead.
Taints	Scheduling constraints preventing certain pods from running.

Example Output (Partial):

Name:               minikube
Roles:              control-plane
Labels:             kubernetes.io/hostname=minikube
Capacity:           cpu: 2, memory: 2Gi
Allocatable:        cpu: 2, memory: 1.8Gi
Taints:             <none>
Unschedulable:      false


📸 Screenshot Required:

Capture terminal showing node metadata and label details.

⚖️ 4. Node Scaling and Maintenance

While Minikube operates a single-node cluster, understanding scaling concepts is essential for real-world clusters.

🔼 Node Scaling

In production, scaling adds or removes worker nodes to balance workloads.
For Minikube, you can simulate resource scaling by increasing resources:

minikube config set memory 4096
minikube config set cpus 4


Then restart the cluster:

minikube start

🔄 Node Upgrades

To align your cluster with the latest Kubernetes version:

minikube update


Output Example:

🔄  Updating Minikube to the latest Kubernetes release...
🎉  Minikube successfully updated to v1.29.0


📸 Screenshot Required:

Capture Minikube update output confirmation.

🧪 5. Validation and Verification
Task	Command	Expected Output	Status
Start cluster	minikube start	Cluster initialized successfully	✅ Completed
Check node status	kubectl get nodes	Node shows status “Ready”	✅ Completed
Inspect node details	kubectl describe node minikube	Displays metadata and resource info	✅ Completed
Stop cluster	minikube stop	Node stopped gracefully	✅ Completed
Delete cluster	minikube delete	Cluster deleted successfully	✅ Completed
🧾 6. Deliverables Checklist
Deliverable	Description	Status	Evidence
minikube start output	Cluster initialized and ready	✅	Screenshot 1
kubectl get nodes output	Node listed as Ready	✅	Screenshot 2
kubectl describe node	Detailed node information	✅	Screenshot 3
minikube stop output	Graceful shutdown of node	✅	Screenshot 4
minikube delete output	Cluster removed successfully	✅	Screenshot 5
🧰 7. Troubleshooting Guide
Issue	Possible Cause	Recommended Solution
Minikube fails to start	Virtualization disabled or insufficient memory	Enable virtualization in BIOS / Increase resources
Node shows NotReady	Network or kubelet issue	Run minikube stop && minikube start
kubectl not found	CLI tool not installed	Install using sudo snap install kubectl --classic
Slow Minikube startup	Low system resources	Increase CPU/memory allocation
Cluster deletion error	Residual VM files	Run minikube delete --all --purge
🧩 8. Summary of Key Learnings

A Kubernetes Node is the foundation of any cluster, running containers and managing workloads.

Minikube provides a simple, local environment to simulate Kubernetes operations.

You can start, inspect, stop, and delete nodes easily using Minikube and kubectl.

Understanding scaling and maintenance prepares you for real-world cluster administration.

Verification, troubleshooting, and clear evidence are essential in operational documentation.

🧭 9. Reflection

Working on this project deepened my understanding of Kubernetes architecture and how nodes operate within a cluster.
I learned to manage the full node lifecycle — from creation to inspection and deletion — using Minikube commands.
The project emphasized the importance of validation, scalability, and documentation in DevOps workflows.
These foundational skills will help me confidently manage and automate Kubernetes clusters in professional environments.

📷 10. Submission Evidence Summary
Evidence Type	Description
Screenshot 1	Terminal showing minikube start and successful cluster setup
Screenshot 2	Output of kubectl get nodes showing node Ready
Screenshot 3	Output of kubectl describe node minikube
Screenshot 4	Terminal output for minikube stop
Screenshot 5	Confirmation of cluster deletion via minikube delete
🧠 11. References

Kubernetes Documentation

Minikube Official Guide

Kubectl Commands Overview

Container Orchestration Concepts

Author: Abraham Aigbokhan
Project Title: Working with Kubernetes Nodes
Platform: Minikube + Kubectl
Date: October 2025
Cluster Type: Single-node (Local Development)
