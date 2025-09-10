# company-project-java-codebase

This is a sample Java application built with Maven, demonstrating a clean, professional project structure. The project includes unit tests, Docker image creation, and security scanning integration using Trivy.

# Features

Java 17 with Maven build system
Simple “Hello World” application (MainApp)
Unit testing with JUnit 5
Docker image packaging of the .jar file
Docker image vulnerability scanning using Trivy

# Prerequisites

Java 17 JDK
Maven
Docker (for building and running container images)
Trivy (for scanning Docker images)

# DevOps CI/CD Project – End-to-End Automation with Jenkins, Docker, and Kubernetes
# Objective

To design and implement an industrial-grade CI/CD pipeline that automates the process of building, containerizing, and deploying a Java-based web application.
The goal was to move from manual deployments to a fully automated pipeline, ensuring faster delivery, better scalability, and production-like workflows.

# Challenges Identified

Build Automation: Need to compile and package a Java application consistently across environments.
Artifact Management: Ensure builds are reproducible and images are available in a central repository.
Deployment: Automate rollout of new versions to a Kubernetes cluster without downtime.
Scalability & Access: Expose the application publicly with load balancing and path-based routing.
Separation of Concerns: Split pipelines into CI (integration, testing, packaging) and CD (deployment, rollout).

#  Solution Implemented
1. Continuous Integration (CI) Pipeline

Built a Spring Boot Java app with /hello endpoint.
Configured pom.xml for Maven build.
Jenkins CI pipeline steps:
Pull code from GitHub (triggered via webhook).
Compile & test with Maven.
Package into a .jar.
Build Docker image.
Push Docker image to Docker Hub (latest + versioned tags).

2. Continuous Deployment (CD) Pipeline

Created Kubernetes manifests:
Deployment: Scalable replica sets of the app.
Service (ClusterIP): Internal service discovery.
Ingress: Public entrypoint with path-based routing (/app1).
Installed NGINX Ingress Controller for routing traffic.
Configured Jenkins CD pipeline to:
Apply deployment, service, and ingress manifests.
Perform rolling updates (kubectl rollout status).
Application available at:

http://<Public-IP>/app1

# Impact & Results

Zero-touch deployments: Every commit results in a new Docker image and automated rollout.
Reduced deployment time: From manual ~30 minutes to ~3 minutes fully automated.
Production-like workflow: Using the same stack (Docker + Kubernetes + Jenkins) as enterprises.
Scalability: Kubernetes ensures the app can scale horizontally.
Industrial-grade skillset: Covers CI, CD, Docker, Kubernetes, Ingress, and automation — exactly what real DevOps teams use.

# Key Takeaways

Split pipelines into CI (integration, build, push) and CD (deployment, rollout).
Use Docker Hub (or any registry) as the single source of truth for images.
Apply Kubernetes best practices (ClusterIP for services, Ingress for routing).
Secure secrets and kubeconfig in Jenkins credentials.
This project is a portfolio-grade DevOps automation workflow — valuable for resumes, interviews, and real deployments.

![ci-pipeline-demo](/assets/ci-pipeline-demo.gif)

# CI-Pipeline architecture

![ci-pipeline](/assets/CI-pipeline.png)

