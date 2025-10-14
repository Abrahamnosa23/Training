# Docker Hands-On Project: Building and Running a Web Server Container

## 🧭 Overview

This project demonstrates the practical use of **Docker** for creating, managing, and running containers using **NGINX** and **Ubuntu** images.  
You’ll learn how to:
- Pull images from Docker Hub  
- Create and build a custom Dockerfile  
- Run and manage containers  
- Configure AWS EC2 security groups to access the running container via a web browser

---

## 1️⃣ Understanding Docker Images

### What are Docker Images?

Docker images are the blueprints for containers.  
They include all the necessary dependencies, system libraries, and configurations required to run applications in isolated environments.

### Viewing Available Images

You can view all locally downloaded Docker images with:

```bash
docker images
```

Example Output:

|REPOSITORY   |TAG      |IMAGE ID       |CREATED         |SIZE|
|-------------|---------|---------------|----------------|----|
|ubuntu       |latest   |174c8c134b2a   |2 weeks ago     |77.9MB |
|hello-world  |latest   |d2c94e258dcb   |7 months ago    |13.3KB |


## 2️⃣ Pulling Images from Docker Hub

Searching for Images

Use the following command to search for an image on Docker Hub:

```bash
docker search ubuntu
```

This lists all available images for Ubuntu, showing whether they are official and their descriptions.

Official images (marked “OK” in the “OFFICIAL” column) are verified by Docker and recommended for use.

### Pulling the Ubuntu Image

To download an official Ubuntu image:

```bash
docker pull ubuntu
```

Example Output:

```vbnet
Using default tag: latest
latest: Pulling from library/ubuntu
Digest: sha256:6042590cf4b44023ea1894effe7890666b0c5c707ed1d83a97c36c76aee60b9b
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```

## 3️⃣ Creating a Dockerfile

What is a Dockerfile?

A Dockerfile is a text-based configuration file that contains step-by-step instructions to build a Docker image.
It defines:

- The base image to use
- Dependencies and files to include
- Ports to expose
- Commands to run when the container starts

Example: Building an NGINX Container with HTML

- Create a file named Dockerfile
- Paste the following content:

```dockerfile
# Use the official NGINX base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR /usr/share/nginx/html/

# Copy the local HTML file to the NGINX default public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

# No need for CMD as NGINX image includes default start command
```

Add a Simple HTML File

Create an index.html file in the same directory:

```bash
echo "Welcome to Darey.io" >> index.html
```


## 4️⃣ Building a Docker Image

Run the following command in the directory containing your Dockerfile:

```bash
docker build -t dockerfile .
```

Example Output:

```nginx
Successfully built cbf8f2f78d62
Successfully tagged dockerfile:latest
```

To verify your new image:

```bash
docker images
```

Expected Output:

|REPOSITORY   |TAG      |IMAGE ID       |CREATED          |SIZE|
|-------------|---------|---------------|-----------------|-----|
|dockerfile   |latest   |cbf8f2f78d62   |12 minutes ago   |187MB|
|ubuntu       |latest   |174c8c134b2a   |2 weeks ago      |77.9MB|
|hello-world  |latest   |d2c94e258dcb   |7 months ago     |13.3KB|


## 5️⃣ Running a Container

Start a new container from your custom image:

```bash
docker run -p 8080:80 dockerfile
```

Explanation:

- -p 8080:80 maps port 8080 on your host to port 80 inside the container.
- dockerfile is the image name.

Once started, you should see NGINX initialization messages confirming the web server is running.

## 6️⃣ Managing Containers

Viewing Containers

List all containers (running or stopped):

```bash
docker ps -a
```

Example Output:

```sql
|CONTAINER ID   |IMAGE        |COMMAND                  |CREATED          |STATUS                     |PORTS|
|---------------|-------------|-------------------------|-----------------|---------------------------|-----|
|644192dc6d81   |dockerfile   |"/docker-entrypoint..."  |35 minutes ago   |Up 33 minutes              |0.0.0.0:8080->80/tcp|
|6a0341206768   |hello-world  |"/hello"                 |1 hour ago       |Exited (0) 1 hour ago      |          |
```

Starting a Stopped Container

If your container is not running, start it manually:

```bash
docker start 644192dc6d81
```

Then verify it’s running:

```bash
docker ps -a
```

## 7️⃣ Accessing the Web Application

Once your container is running, you can access your hosted HTML page in a web browser using:

```cpp
http://<your_public_ip>:8080
```

Example:
http://18.205.11.142:8080

You should see the text:
“Welcome to Darey.io”

## 8️⃣ Configuring Security Group Rules (AWS EC2)

If running Docker on an AWS EC2 instance, ensure your instance allows incoming traffic on port 8080.

Steps:

1. Go to your EC2 instance on AWS Console.
2. Select the Security tab.
3. Click Edit inbound rules.
4. Click Add rule:
    - Type: Custom TCP Rule
    - Port Range: 8080
    - Source: 0.0.0.0/0 (for global access)
5. Save changes.

This enables web traffic to your container from the internet.


## 9️⃣ Verifying and Cleaning Up

Verify Access

Visit http://<public_ip>:8080 in a browser to confirm successful deployment.

Stop or Remove Containers

To stop a container:

```bash
docker stop <container_id>
```

To remove containers:

```bash
docker rm <container_id>
```

To remove images:

```bash
docker rmi <image_name>
```

## ✅ Summary

|Task	|Command	|Description|
|-----|---------|-----------|
|Search images	|docker search ubuntu	|Find available images on Docker Hub|
|Pull image	|docker pull ubuntu	|Download image locally|
|View images	|docker images	|List available images|
|Build image	|docker build -t dockerfile .	|Create new image from Dockerfile|
|Run container	|docker run -p 8080:80 dockerfile	|Launch container|
|View containers	|docker ps -a	|See all containers|
|Start container	|docker start <container_id>	|Restart stopped container|


## 💡 Best Practices

- Use official base images whenever possible.
- Always clean up unused containers and images to save disk space.
- Use Docker Compose for managing multi-container applications.
- Keep Dockerfiles simple, modular, and well-documented.

## Author: Your Name
Date: October 2025
Purpose: Hands-on demonstration of Docker image creation, containerization, and deployment on AWS EC2.
