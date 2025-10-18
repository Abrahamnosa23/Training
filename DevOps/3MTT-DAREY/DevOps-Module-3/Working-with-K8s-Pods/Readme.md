# 🧩 Working with Kubernetes Pods — Complete Project

## 📘 Overview

This project introduces **Kubernetes Pods**, the smallest deployable and manageable units in Kubernetes.  
Using **Minikube** and **kubectl**, you will learn how to create, inspect, and manage Pods, and understand how containers run within them.

By completing this project, you will gain hands-on experience in **deploying, inspecting, and managing Pods** in a local Kubernetes environment.

---

## 🎯 Learning Objectives

| Objective | Description | Status |
|------------|--------------|---------|
| Understand what Pods are and their role in Kubernetes | Learn how Pods encapsulate containers | ✅ Completed |
| Manage Pods using `kubectl` | Execute commands to list, describe, and delete Pods | ✅ Completed |
| Understand the relationship between Pods and containers | Learn how containers function inside Pods | ✅ Completed |
| Demonstrate Pod inspection and deletion | Execute and verify commands using outputs/screenshots | ✅ Completed |
| Reflect on the practical application of Pods in orchestration | Summarize learnings from managing Pods | ✅ Completed |

---

## ⚙️ 1. Understanding Pods in Kubernetes

A **Pod** is the **smallest deployable unit** in Kubernetes.  
It represents **one or more tightly coupled containers** that share:
- The same **network namespace** (can communicate via `localhost`).
- The same **storage volumes**.
- The same **lifecycle and configuration context**.

> 🧠 Think of a Pod as a "box" that holds one or more containers that work together as a single application unit.

### 🌍 Why Pods Matter
- Provide **encapsulation** for containers.  
- Enable **co-located services** (e.g., app + sidecar container).  
- Simplify **scaling and orchestration** in clusters.

---

## 🧰 2. Prerequisites

Before beginning:
- Minikube and kubectl are installed and configured.
- Minikube cluster is running (`minikube start`).
- Basic understanding of Docker and container concepts.

---

## 🚀 3. Managing Pods in Kubernetes

You’ll use the `kubectl` CLI tool to interact with your Minikube cluster and manage Pods.

---

### 🟢 Step 1: List All Pods

```bash
kubectl get po -A
```

### Purpose:
Displays all Pods running across all namespaces (-A = All Namespaces).

Example Output:

```sql
Copy code
NAMESPACE     NAME                              READY   STATUS    RESTARTS   AGE
kube-system   coredns-5dd5756b68-srdms          1/1     Running   0          171m
kube-system   etcd-minikube                     1/1     Running   0          171m
kube-system   kube-apiserver-minikube           1/1     Running   0          171m
kube-system   kube-controller-manager-minikube  1/1     Running   0          171m
kube-system   kube-proxy-7wgnh                  1/1     Running   0          171m
kube-system   kube-scheduler-minikube           1/1     Running   0          171m
```

✅ Verification Command:

```bash
kubectl get pods -n kube-system
```

🟠 Step 2: Inspect a Specific Pod
```bash
kubectl describe pod <pod-name> -n kube-system
```

Purpose:
Displays detailed Pod configuration — useful for troubleshooting or reviewing resource allocation.

Example Command:

```bash
kubectl describe pod coredns-5dd5756b68-srdms -n kube-system
```

Key Information Displayed:

|Field	|Description|
|-------|-----------|
|Name	|Name of the Pod|
|Namespace	|Logical grouping of resources|
|Node	|Node hosting the Pod|
|Containers	|Containers running in the Pod|
|Events	|Lifecycle events (e.g., Created, Started, Scheduled)|
|Status	|Running, Pending, or Failed|

Example Output (Partial):

```yaml
Copy code
Name:           coredns-5dd5756b68-srdms
Namespace:      kube-system
Node:           minikube
Start Time:     Fri, 12 Jan 2024 11:53:09 +0100
Containers:
  coredns:
    Image:      k8s.gcr.io/coredns/coredns:v1.10.1
    Port:       53/UDP
    State:      Running
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  24m   default-scheduler  Successfully assigned kube-system/coredns-5dd5756b68-srdms to minikube
```


## 🔴 Step 3: Delete a Pod
```bash
kubectl delete pod <pod-name> -n kube-system
```

Example Command:

```bash
kubectl delete pod coredns-5dd5756b68-srdms -n kube-system
```

Expected Output:

```nginx
pod "coredns-5dd5756b68-srdms" deleted
```

Verification Command:

```bash
kubectl get po -A
```

Expected Output (After Deletion):

```sql
NAMESPACE     NAME                             READY   STATUS    RESTARTS   AGE
kube-system   coredns-5dd5756b68-nfx2r         1/1     Running   0          15s
```

Note: Kubernetes automatically recreates critical system Pods such as CoreDNS.

## 🧱 4. Containers in Kubernetes

Definition and Purpose

A Container is a lightweight, standalone package containing everything needed to run an application — code, runtime, and dependencies.

In Kubernetes:

Containers live inside Pods.

Pods provide the execution environment and shared networking/storage.

Multiple containers in a Pod can communicate via localhost.

Analogy:
If a Pod is an “apartment,” containers are the “rooms” inside — separate but sharing the same address and utilities.

## 🧩 5. Defining Pods with Containers (YAML Example)

Here’s a simple Pod manifest defining one container inside a Pod:

```yaml
Copy code
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    app: nginx
spec:
  containers:
  - name: nginx-container
    image: nginx:latest
    ports:
    - containerPort: 80
```

Save as: nginx-pod.yaml

Deploy the Pod:

```bash
kubectl apply -f nginx-pod.yaml
```

Verification:

```bash
kubectl get pods
```

Expected Output:

```sql
NAME         READY   STATUS    RESTARTS   AGE
nginx-pod    1/1     Running   0          15s
```

## 🔍 Inspect Pod Logs
```bash
kubectl logs nginx-pod
```

Expected Output:

``` swift
127.0.0.1 - - [12/Oct/2025:15:22:00 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.68.0"
```

❌ Delete the Pod

```bash
kubectl delete -f nginx-pod.yaml
```

Output:

```nginx
pod "nginx-pod" deleted
```

##🧾 6. Deliverables Checklist

|Deliverable	|Description	|Status	|Evidence|
|List Pods (kubectl get po -A)	|Display all running Pods in cluster	|✅	|Screenshot 1|
|Describe Pod (kubectl describe pod)	|Show detailed Pod info and events	|✅	|Screenshot 2|
|Delete Pod (kubectl delete pod)	|Remove and verify recreation (if system pod)	|✅	|Screenshot 3|
|Create Custom Pod (nginx-pod.yaml)	|Deploy new Pod to Minikube	|✅	|Screenshot 4|
|Verify Pod Logs	|Display container activity	|✅	|Screenshot 5|
|Delete Custom Pod	|Clean up deployed Pod	|✅	|Screenshot 6|

## 🧰 7. Troubleshooting Guide

|Issue	|Cause	|Solution|
|Pod stuck in Pending	|Insufficient node resources	|Increase Minikube CPU/memory using minikube config set|
|kubectl command not found	|CLI not installed	|Install with sudo snap install kubectl --classic|
|Pod not deleted	|Pod part of system namespace	|Ensure you target correct namespace using -n flag|
|Container image pull error	|Network issue or invalid tag	|Check internet and image name (e.g., nginx:latest)|
|Pod recreated automatically	|System-managed Pod (CoreDNS, Kube-proxy)	|Normal behavior; Kubernetes self-healing in action|

## 🧩 8. Summary of Key Learnings

- Pods are the core execution units of Kubernetes, encapsulating containers.
- Every Pod can host one or more containers that share resources and context.
- Managing Pods involves listing, describing, and deleting using kubectl.
- YAML manifests define Pods declaratively for repeatable deployments.
- Minikube provides an excellent local platform for testing Kubernetes deployments safely.

## 🧭 9. Reflection
Working with Kubernetes Pods provided a foundational understanding of how containerized applications are deployed and managed in a cluster.
I learned how Pods encapsulate containers, how to create and inspect them using YAML, and how Kubernetes maintains system Pods automatically.
This hands-on experience built confidence in using kubectl and understanding orchestration concepts that scale into real production environments.

## 📷 10. Evidence Summary

|Evidence Type	|Description|
|---------------|-----------|
|Screenshot 1	|kubectl get po -A showing Pods in all namespaces|
|Screenshot 2	|kubectl describe pod output with container details|
|Screenshot 3	|Pod deletion output with recreation (if applicable)|
|Screenshot 4	|Creation of custom Pod (nginx-pod.yaml)|
|Screenshot 5	|Logs output from kubectl logs nginx-pod|
|Screenshot 6	|Deletion of custom Pod confirmation|

## 🧠 11. References

- Kubernetes Documentation — Pods
- Minikube Official Guide
- Kubectl Cheat Sheet
- YAML Configuration Guide
- Docker and Container Basics

## Author: Abraham Aigbokahn
Project Title: Working with Kubernetes Pods
Platform: Minikube + Kubectl
Date: October 2025
Cluster Type: Single-node (Local Development)
