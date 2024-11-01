## Solution Summary

For this technical challenge, I set up a local Minikube Kubernetes cluster, forked the p2p-devops-test repository, and enhanced the Go application by adding health endpoints to support Kubernetes readiness and liveness probes. I initially deployed the application using Kustomize while familiarizing myself with Helm, then created Helm charts for a fault-tolerant, scalable production setup and a minimal staging configuration. I installed ArgoCD on Minikube and configured an ArgoCD application manifest to manage deployments using GitOps with auto-sync enabled. Additionally, I set up a GitFlow-based CD pipeline to deploy across environments through ArgoCD, with options for further automation using GitHub Actions.


## Solution Design:

![image](https://github.com/user-attachments/assets/1f5f238e-c57c-49d5-8962-ca5147a0579b)


## Solution Outline:

Here’s a refined solution outline with a breakdown of each component and its role in achieving a structured, automated CI/CD workflow with GitOps principles,

### 1. Development Workflow (Local)
#### Enhance and Test Application:

* Use Docker to build and containerize the Go application with added health endpoints.

* Run the container on Minikube, utilizing kubectl port-forward to verify readiness and liveness probes.

#### Deploy to Local Cluster:
* Start by deploying using Kustomize for quick testing and validation of configurations.

* Transition to Helm for managing production-readiness, utilizing Helm charts for streamlined configuration adjustments.

* Iterate on Minikube deployments to test changes quickly and prepare for production standards.

### 2. GitFlow-based Continuous Deployment Pipeline (Staging and Production)

#### CI/CD Pipeline Integration with GitHub Actions:

##### Set up GitHub Actions workflows to automate tasks, including:

* Building and pushing Docker images to the GitHub Container Registry.

* Running automated tests for each pull request, ensuring quality and stability.

* Triggering ArgoCD syncs automatically upon successful merges to the master branch, facilitating continuous delivery.

### 3. Automated Deployment with ArgoCD

#### ArgoCD Application Manifest:

* Define an ArgoCD application manifest that specifies the Helm chart repository, enabling GitOps-driven deployments with auto-sync capabilities.

#### ArgoCD Sync Configuration:

* Configure ArgoCD to monitor master branch.

* Enable auto-sync to trigger automatic deployments to staging and production environments on Minikube when changes are merged, promoting a seamless and automated GitOps process.

### 4. Helm Chart Setup for Environment-Specific Deployments

#### Production Helm Chart:

##### Configure the production environment for resilience and scalability, with:

* Multiple replicas for fault tolerance.

* Kubernetes readiness and liveness probes.

#### Staging Helm Chart:

##### Optimize for minimal resource usage while reflecting production configurations closely to maintain parity:

* Limit replicas and resources as needed.

* Use Kustomize overlays if required for staging-specific configurations.

### 5. Monitoring and Health Checks

#### Readiness and Liveness Probes:

* Implement Kubernetes readiness and liveness probes in the Helm charts to ensure the application is healthy and ready, enabling Kubernetes to handle rolling updates or restarts if a pod becomes unhealthy.


