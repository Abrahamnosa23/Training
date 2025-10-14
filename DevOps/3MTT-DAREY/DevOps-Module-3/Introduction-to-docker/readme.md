# 🐳 Introduction to Docker and Containers

> A foundational project for understanding containerization, Docker installation, basic commands, and how containers revolutionize modern software development.

---

## 📚 Table of Contents
- [Overview](#overview)
- [What Are Containers?](#what-are-containers)
- [Advantages of Containers](#advantages-of-containers)
- [Docker vs Virtual Machines](#docker-vs-virtual-machines)
- [Importance of Docker](#importance-of-docker)
- [Target Audience](#target-audience)
- [Prerequisites](#prerequisites)
- [Project Goals](#project-goals)
- [Getting Started with Docker](#getting-started-with-docker)
  - [Installing Docker](#installing-docker)
  - [Running the "Hello World" Container](#running-the-hello-world-container)
  - [Understanding Images and Containers](#understanding-images-and-containers)
  - [Verifying Docker Installation](#verifying-docker-installation)
- [Basic Docker Commands](#basic-docker-commands)
- [Supplementary Docker Commands](#supplementary-docker-commands)
- [Conclusion](#conclusion)
- [References](#references)

---

## 🧠 Overview

In the realm of software development, teams often faced a frustrating dilemma:  
> “It works on my machine!” but not anywhere else.

To solve this, **Solomon Hykes** introduced **Docker** in 2013 — a containerization platform that changed how developers build, ship, and run applications.

Docker allows you to package your application with **everything it needs** — code, libraries, dependencies, and configurations — into a **portable, lightweight container** that runs consistently across environments.

---

## 📦 What Are Containers?

Containers are isolated units of software that package code and its dependencies together so the application runs quickly and reliably across computing environments.  
They eliminate the “works on my machine” problem by ensuring consistency from development to production.

> Think of containers as magical vessels that carry everything an app needs to perform flawlessly, regardless of where it runs.

---

## 🚀 Advantages of Containers

### 🧳 1. Portability Across Environments
Containers encapsulate the entire app and its dependencies, making it run identically on different systems — developer laptops, test servers, or production clusters.

### ⚙️ 2. Resource Efficiency vs Virtual Machines
Unlike VMs, containers share the host OS kernel, making them lightweight and faster to start, with minimal overhead.

### ⚡ 3. Rapid Deployment and Scaling
Containers can be started, stopped, or duplicated in seconds — perfect for scaling applications during peak usage.

---

## 🖥️ Docker vs Virtual Machines

| Feature | Docker Containers | Virtual Machines |
|----------|------------------|------------------|
| Virtualization Type | OS-level | Hardware-level |
| Startup Speed | Seconds | Minutes |
| Resource Efficiency | High | Moderate to Low |
| Portability | Excellent | Limited |
| Isolation | Moderate | Strong |
| Ideal For | Microservices, CI/CD | Full OS isolation |

Docker’s lightweight, modular architecture makes it a superior choice for modern DevOps and microservices workflows.

---

## 🌍 Importance of Docker

### 🔧 Technology Impact
Docker has transformed software delivery pipelines by enabling faster, more reliable deployments. It introduced **container orchestration**, **CI/CD automation**, and **cloud portability**.

### 💼 Industry Impact
Companies leverage Docker for:
- Streamlined DevOps workflows  
- Cost-efficient resource management  
- Faster software releases  
- Consistent deployment across environments  

---

## 🎯 Target Audience

This course/project is designed for:

- **DevOps Engineers** – managing containerized infrastructure  
- **Developers** – simplifying application setup and deployment  
- **Cloud/QA Engineers** – ensuring consistency across test & production  
- **Students & Enthusiasts** – learning foundational container technology  

---

## 🧩 Prerequisites

Before starting, you should:

- Complete **TechOps Career Essentials** and **Advanced TechOps** courses.  
- Be comfortable with **Linux** command-line usage.  
- Have a **basic understanding of cloud computing** and virtual machines.

---

## 🏁 Project Goals

By completing this project, you will:

✅ Understand how containers work and how they differ from VMs  
✅ Learn essential Docker commands and workflows  
✅ Deploy and manage containers on Ubuntu Linux  
✅ Verify Docker setup and run a sample container  
✅ Build confidence in using Docker for scalable deployments  

---

## ⚙️ Getting Started with Docker

### 🧩 Installing Docker on Ubuntu 20.04 LTS

Launch an Ubuntu instance and connect via SSH, then run the following commands:

```bash
# Update system packages
sudo apt-get update

# Install prerequisites
sudo apt-get install ca-certificates curl gnupg

# Create keyring directory
sudo install -m 0755 -d /etc/apt/keyrings

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set permissions
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list again
sudo apt-get update

# Install Docker Engine
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```


## Verify installation:

```bash
sudo systemctl status docker
```

Allow Docker to be run without sudo:

```bash
sudo usermod -aG docker ubuntu
```

Log out and back in for changes to take effect.

## 🐋 Running the “Hello World” Container

Test Docker functionality with:

```bash
docker run hello-world
```

Expected output:

```css
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

## 🔄 Understanding Images and Containers

- Docker Image – A blueprint (template) that contains the app and dependencies. Immutable.
- Docker Container – A running instance of an image with its own environment.

Lifecycle:

Create → Start → Stop → Remove

List your local images:

```bash
docker images
```

##💡 Basic Docker Commands
| Command	| Description |
|---------|-------------|
| docker run <image>	| Run a container |
| docker ps	| Show running containers |
| docker ps -a	| Show all containers |
| docker stop <container_id>	| Stop a container |
| docker pull <image>	| Download an image |
| docker push <repo/image>	| Upload an image |
| docker rmi <image_id>	| Remove an image |
| docker images	| List local images |

Example:

```bash
docker run -d -p 8080:80 nginx
docker ps
docker stop <container_id>
```

## 🧭 Supplementary Docker Commands

Stop a Running Container

```bash
docker stop <container_id>
```

Pull an Image

```bash
docker pull ubuntu
```

Push an Image

```bash
docker push username/image-name
```

Remove an Image

```bash
docker rmi <image_id>
```

## 🏆 Conclusion

Docker is a transformative tool that bridges the gap between development and production by providing consistency, portability, and scalability.
With this foundation, you are now ready to explore Docker Compose, Kubernetes, and advanced container orchestration.

“Build once, run anywhere” — the true spirit of containerization.

## 🔗 References

- Docker Official Documentation
- Docker Hub
- Containerization Overview
- Linux Command Reference

## ✍️ Author

Abraham Aigbokhan
DevOps & Cloud Enthusiast | TechOps Learner | Building scalable solutions for Africa.
