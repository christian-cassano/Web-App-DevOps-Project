# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repository! This project focuses on building a web application for managing and tracking orders within a business environment. It provides a user-friendly interface for viewing existing orders, adding new orders, and ensuring data validation for accuracy.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Infrastructure as Code (IaC) with Terraform for Azure Networking Services](#infrastructure-as-code-iac-with-terraform-for-azure-networking-services)
- [Provisioning an AKS Cluster with Terraform](#provisioning-an-aks-cluster-with-terraform)
- [Deployment to Azure Kubernetes Service (AKS)](#deployment-to-azure-kubernetes-service-aks)
- [Continuous Integration and Continuous Deployment (CI/CD) with Azure DevOps](#continuous-integration-and-continuous-deployment-cicd-with-azure-devops)
- [Testing and Validation](#testing-and-validation)
- [Contributing](#contributing)
- [License](#license)

---

# Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
  ![Order List](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Navigate through multiple pages of orders using built-in pagination controls.
  
  ![Pagination](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
  ![Add New Order](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

---

# Getting Started

## Prerequisites

Before running the application or deploying infrastructure, ensure the following tools are installed:

- Python 3.x
- Flask 2.2.2
- PyODBC 4.0.39
- SQLAlchemy 2.0.21
- Werkzeug 2.2.3
- Terraform
- Azure CLI

## Installation and Usage

1. **Clone Repository:**
   ```bash
   git clone https://github.com/maya-a-iuga/Web-App-DevOps-Project.git
   cd Web-App-DevOps-Project

# Run Application: 
python app.py

## Technology Stack

- Backend: Flask handles routing, data processing, and interactions with the Azure SQL Database.

- Frontend: Utilizes HTML, CSS, and JavaScript for an intuitive user interface.

- Database: Azure SQL Database stores and manages order-related data securely.

### Infrastructure as Code (IaC) with Terraform for Azure Networking Services

This section details the provisioning of Azure networking services using Infrastructure as Code (IaC) with Terraform. The infrastructure setup includes creating an Azure Resource Group, a Virtual Network (VNet), subnets for the control plane and worker nodes, and a Network Security Group (NSG).

## Prerequisites

Ensure you have the following tools installed and configured:

- Terraform
- Azure CLI

## Project Structure

# The project is organized into modules for modularity and clarity:

- networking-module: Terraform configuration for Azure networking services.
- aks-cluster-module: Terraform configuration for AKS cluster provisioning.


# Usage

## Clone Repository:

git clone https://github.com/maya-a-iuga/Web-App-DevOps-Project.git
cd Web-App-DevOps-Project/networking-module

## Initialize Terraform:

terraform init

## Review and Apply Terraform Configuration:

terraform apply

Follow the prompts to provision networking resources in Azure.

# Input Variables

The networking module accepts input variables such as:

resource_group_name: Name of the Azure Resource Group.
location: Azure region for resource deployment.
vnet_address_space: Address space for the Virtual Network (VNet).

# Output Variables

After provisioning, obtain output variables such as:

- vnet_id: ID of the Virtual Network (VNet).
- control_plane_subnet_id: ID of the control plane subnet.
- worker_node_subnet_id: ID of the worker node subnet.
- networking_resource_group_name: Name of the Azure Resource Group.
- aks_nsg_id: ID of the Network Security Group (NSG).

Provisioning an AKS Cluster with Terraform

This section demonstrates provisioning an Azure Kubernetes Service (AKS) cluster using Infrastructure as Code (IaC) with Terraform. It automates AKS cluster creation, integrates with previously provisioned networking resources, and configures necessary settings.

## Prerequisites

Ensure the following tools are installed and configured:

- Terraform
- Azure CLI


# Project Structure

The project is structured into modules:

- networking-module: Handles Azure networking services.
- aks-cluster-module: Manages AKS cluster provisioning.

# Usage

## Navigate to AKS Module:
cd Web-App-DevOps-Project/aks-cluster-module

## Initialize Terraform:

terraform init

## Review and Apply Terraform Configuration:

terraform apply

Proceed with provisioning the AKS cluster, providing necessary input variables.

## Input Variables

The AKS cluster module requires input variables such as:

- aks_cluster_name: Name of the AKS cluster.
- cluster_location: Azure region for AKS deployment.
- dns_prefix: DNS prefix for AKS cluster.
- kubernetes_version: Kubernetes version used.
- service_principal_client_id: Client ID for AKS service principal.
- service_principal_secret: Client Secret for AKS service principal.
- resource_group_name: Name of Azure Resource Group for networking.
- vnet_id: ID of the Virtual Network (VNet) used.
- control_plane_subnet_id: ID of the control plane subnet.
- worker_node_subnet_id: ID of the worker node subnet.
- Output Variables

After AKS cluster provisioning, retrieve output variables such as:

- aks_cluster_name: Name of the AKS cluster.
- aks_kubeconfig: Kubernetes configuration file for the AKS cluster.

# Deployment to Azure Kubernetes Service (AKS)

This section focuses on deploying your application to Azure Kubernetes Service (AKS) using Kubernetes manifests for both Deployment and Service.

# Kubernetes Deployment Manifest

## The Kubernetes Deployment manifest (application-manifest.yaml) defines:

- Deployment Name: flask-app-deployment for managing the containerized application.
- Replicas: Configured for two replicas to ensure scalability and high availability.
- Labels: Uses app: flask-app for selector and pod template metadata, connecting pods with the application.
- Container: Specifies the Docker Hub container image for deployment on port 5000.
- Strategy: Implements Rolling Updates to maintain application availability during updates.

apiVersion: apps/v1
kind: Deployment
metadata:
  name: flask-app-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: flask-app
  template:
    metadata:
      labels:
        app: flask-app
    spec:
      containers:
        - name: flask-app-container
          image: your-docker-hub-image:tag
          ports:
            - containerPort: 5000
      strategy:
        type: RollingUpdate
        rollingUpdate:
          maxUnavailable: 1
Kubernetes Service Manifest

# The Kubernetes Service manifest (application-manifest.yaml) defines:

Service Name: flask-app-service for accessing the application within the AKS cluster.
Port Mapping: Exposes port 80 on the AKS cluster to port 5000 on the application containers.
Selector: Matches pods labeled with app: flask-app to route traffic to deployed instances.

apiVersion: v1
kind: Service
metadata:
  name: flask-app-service
spec:
  ports:
    - protocol: TCP
      port: 80
      targetPort: 5000
  selector:
    app: flask-app
  type: LoadBalancer


# Deploying Kubernetes Manifests

##Apply Deployment Manifest:
kubectl apply -f application-manifest.yaml
##Apply Service Manifest:
kubectl apply -f service-manifest.yaml
Access your application using the public IP provided by the Load Balancer associated with the flask-app-service.

Continuous Integration and Continuous Deployment (CI/CD) with Azure DevOps

This section outlines setting up CI/CD pipelines using Azure DevOps to automate build, test, and deployment processes for your web application.

# Azure DevOps Pipeline Setup

## Create Project:
Navigate to Azure DevOps and create a new project for your application.

## Set Up Repositories:
Connect Azure DevOps to your GitHub repository containing the application code.

## Create Service Connections:
Configure service connections to Azure resources (Azure Subscription, AKS Cluster).

## Build Pipeline:
Define build tasks to compile code, run tests, and build Docker images.

## Release Pipeline:
Configure release stages to deploy application artifacts to AKS.

# Build Pipeline Configuration

Example azure-pipelines.yml for build pipeline:

trigger:
- main

pool:
  vmImage: 'ubuntu-latest'

steps:
- task: UsePythonVersion@0
  inputs:
    versionSpec: '3.x'
    addToPath: true

- script: |
    pip install flask pyodbc SQLAlchemy werkzeug
  displayName: 'Install dependencies'

- script: |
    pytest --junitxml=test-results/test-results.xml
  displayName: 'Run tests'

- script: |
    docker build -t your-docker-hub-image:$(Build.BuildId) .
    docker push your-docker-hub-image:$(Build.BuildId)
  displayName: 'Build and push Docker image'

  Release Pipeline Configuration

Configure release stages to deploy Docker images to AKS using Kubernetes manifests (application-manifest.yaml).

Define Environment: Create a new environment for AKS.

Add Stage: Use Kubernetes deployment task to apply manifests.

Approvals and Gates: Implement approval gates for deployment to production environments

# Testing and Validation

- Ensure thorough testing and validation of your application and infrastructure components:

- Unit Testing: Test individual components and functions to verify correctness.

- Integration Testing: Validate interactions between different parts of the application.

- End-to-End Testing: Test the entire application flow from user interaction to database updates.

- Performance Testing: Evaluate application performance under expected load conditions.

- Security Testing: Assess application and infrastructure security measures.

# Contributing

Contributions are welcome! Please fork the repository and create a pull request for any enhancements or bug fixes.

# License

This project is licensed under the MIT License. See the LICENSE file for details.
