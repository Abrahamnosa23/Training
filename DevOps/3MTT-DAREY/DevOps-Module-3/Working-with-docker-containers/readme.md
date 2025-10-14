# 🐳 Working with Docker Containers

## 🧭 Introduction

Docker containers are **lightweight**, **portable**, and **executable** units that package an application and all its dependencies together.  
They ensure that applications run consistently across different environments — from local machines to production servers.

In the previous step, we worked with Docker images.  
Now, we’ll dive deeper into **working with Docker containers** — from launching and managing containers to understanding their full lifecycle.

---

## 1️⃣ Running Containers

To create and run a container, use the `docker run` command followed by the image name.

Example: Launch a container from the **official Ubuntu image**.

```bash
docker run ubuntu
```

Example Output:

```bash
ubuntu@ip-172-31-85-134:~$ docker run ubuntu
ubuntu@ip-172-31-85-134:~$ docker ps -a
CONTAINER ID   IMAGE         COMMAND                 CREATED             STATUS                     PORTS                    NAMES
1f7ce9f4a261   ubuntu        "/bin/bash"             22 seconds ago      Exited (0) 21 seconds ago                           confident_albakyan
644192dc6d81   dockerfile    "/docker-entrypoint..." About an hour ago   Up About an hour           0.0.0.0:8080->80/tcp     infallible_babbage
6a0341206768   hello-world   "/hello"                2 hours ago         Exited (0) 2 hours ago                            compassionate_faraday
```

The example above shows that the container is created but not running.

## 2️⃣ Starting a Container

You can start an existing container using the docker start command:

```bash
docker start CONTAINER_ID
```

To verify it’s running:

```bash
docker ps -a
```

## 3️⃣ Launching Containers with Options

Docker provides several options to customize container behavior.

✅ Example: Set Environment Variables

You can define environment variables inside a container using the -e flag:

```bash
docker run -e "MY_VARIABLE=my-value" ubuntu
```

This passes an environment variable MY_VARIABLE with the value my-value into the container.


## 4️⃣ Running Containers in the Background

By default, containers run in the foreground, meaning your terminal session is attached to it.
To run a container in the background (detached mode), use the -d flag:

```bash
docker run -d ubuntu
```

This allows you to keep using your terminal while the container continues running in the background.

## 5️⃣ Container Lifecycle

Containers follow a defined lifecycle, including the stages:

1. Create
2. Start
3. Stop
4. Restart
5. Remove

You can manage these stages using Docker commands.

## ▶️ Start a Stopped Container

```bash
docker start container_name
```

## ⏹️ Stop a Running Container

```bash
docker stop container_name
```

## 🔄 Restart a Container

```bash
docker restart container_name
```

Each of these commands helps manage your container without needing to rebuild or recreate it.

## 6️⃣ Removing Containers

Once you no longer need a container, remove it using:

```bash
docker rm container_name
```

This deletes the container, but note:
The associated image remains on your system — you can still use it to create new containers later.

## 7️⃣ Summary of Container Lifecycle Commands

|Action	          |Command	                 |Description                    |
|-----------------|--------------------------|-------------------------------|
|Run a container	|docker run ubuntu	       |Create and start a new container|
|View all containers	|docker ps -a	|Show running and stopped containers|
|Start container	|docker start <container_id>	|Start a stopped container|
|Stop container	|docker stop <container_id>	|Stop a running container|
|Restart container	|docker restart <container_id>	|Restart an existing container|
|Remove container	|docker rm <container_id>	|Delete a container|


## 🧩 Side Hustle Task: Docker Container Operations

Follow the tasks below to reinforce your understanding of Docker container operations.

1. Start a Container and Run a Simple Command

- Use the official Ubuntu image to start a container.

If not available locally, pull it from Docker Hub:

```bash
docker pull ubuntu
```

Run a simple command inside the container (e.g., view system information):

```bash
docker run ubuntu uname -a
```

2. Stop the Container and Verify its Status

Stop the running container:

```bash
docker stop <container_id>
```

Verify the status:

```bash
docker ps -a
```

Confirm that the Status column shows the container as “Exited”.

3. Restart the Container and Observe Changes

Restart the stopped container:

```bash
docker restart <container_id>
```

Verify its status again using:

```bash
docker ps -a
```

Observe any differences in uptime or behavior after restarting.

4. Remove the Container

Stop the container if it’s still running:

```bash
docker stop <container_id>
```

Remove it from your system:

```bash
docker rm <container_id>
```

Confirm it’s no longer listed:

```bash
docker ps -a
```

## ✅ Conclusion

In this module, you’ve learned how to:

- Launch and manage Docker containers
- Run containers in the background
- Customize container behavior with environment variables
- Control the full container lifecycle
- Safely remove containers when done

These are essential Docker fundamentals — mastering them prepares you for more advanced topics like:

- Networking between containers
- Docker Compose
- Container orchestration (Kubernetes)

## Author: Your Name
Date: October 2025
Project: Docker Container Operations – Side Hustle DevOps Program

