Solution Summary:

For this technical challenge, I set up a local Minikube Kubernetes cluster, forked the p2p-devops-test repository, and enhanced the Go application by adding health endpoints to support Kubernetes readiness and liveness probes. I initially deployed the application using Kustomize while familiarizing myself with Helm, then created Helm charts for a fault-tolerant, scalable production setup and a minimal staging configuration. I installed ArgoCD on Minikube and configured an ArgoCD application manifest to manage deployments using GitOps with auto-sync enabled. Additionally, I set up a GitFlow-based CD pipeline to deploy across environments through ArgoCD, with options for further automation using GitHub Actions.


Solution Design:

![image](https://github.com/user-attachments/assets/65cda2a6-df38-4609-b4ac-7b07b60ece66)
