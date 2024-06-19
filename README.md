# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.

# Infrastructure as Code (IaC) with Terraform for Azure Networking Services

This project demonstrates the provisioning of Azure networking services for an AKS (Azure Kubernetes Service) cluster using Infrastructure as Code (IaC) with Terraform. The networking services include creating an Azure Resource Group, a Virtual Network (VNet), subnets for the control plane and worker nodes, and a Network Security Group (NSG).

## Table of Contents
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Input Variables](#input-variables)
- [Output Variables](#output-variables)

## Prerequisites
Before running Terraform commands, ensure you have the following prerequisites installed and configured:
- [Terraform](https://www.terraform.io/downloads.html)
- Azure CLI with authentication configured

## Project Structure
The project is structured into modules for better organization and modularity:
- `networking-module`: Contains Terraform configuration for provisioning Azure networking services.
- `aks-cluster-module`: Will contain Terraform configuration for provisioning the AKS cluster (not covered in this part of the README, See below ).

## Usage
1. Clone this repository to your local machine.
2. Navigate to the `networking-module` directory.
3. Initialize the networking module by running `terraform init`.
4. Update the input variables in `variables.tf` if necessary.
5. Review the Terraform configuration in `main.tf` to understand the resources being provisioned.
6. Apply the Terraform configuration to provision the networking resources by running `terraform apply`.

## Input Variables
The networking module accepts the following input variables, which can be customized based on your requirements:
- `resource_group_name`: Name of the Azure Resource Group where networking resources will be deployed.
- `location`: Azure region where networking resources will be deployed.
- `vnet_address_space`: Address space for the Virtual Network (VNet).

## Output Variables
After provisioning the networking resources, the following output variables are available:
- `vnet_id`: ID of the Virtual Network (VNet).
- `control_plane_subnet_id`: ID of the control plane subnet within the VNet.
- `worker_node_subnet_id`: ID of the worker node subnet within the VNet.
- `networking_resource_group_name`: Name of the Azure Resource Group where networking resources were provisioned.
- `aks_nsg_id`: ID of the Network Security Group (NSG).

# Provisioning an AKS Cluster with Terraform

This project demonstrates the provisioning of an Azure Kubernetes Service (AKS) cluster using Infrastructure as Code (IaC) with Terraform. It automates the creation of the AKS cluster, including defining networking resources and configuring cluster settings.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Input Variables](#input-variables)
- [Output Variables](#output-variables)

## Prerequisites
Before running Terraform commands, ensure you have the following prerequisites installed and configured:
- [Terraform](https://www.terraform.io/downloads.html)
- Azure CLI with authentication configured

## Project Structure
The project is organized into modules for better organization and modularity:
- `networking-module`: Contains Terraform configuration for provisioning Azure networking services.
- `aks-cluster-module`: Contains Terraform configuration for provisioning the AKS cluster.

## Usage
1. Clone this repository to your local machine.
2. Navigate to the `networking-module` directory and initialize the module by running `terraform init`.
3. Update the input variables in `variables.tf` if necessary.
4. Navigate to the `aks-cluster-module` directory and initialize the module by running `terraform init`.
5. Update the input variables in `variables.tf` if necessary.
6. Review the Terraform configuration in `main.tf` to understand the resources being provisioned.
7. Apply the Terraform configuration to provision the AKS cluster by running `terraform apply`.

## Input Variables
### Networking Module
The networking module accepts the following input variables:
- `resource_group_name`: Name of the Azure Resource Group where networking resources will be deployed.
- `location`: Azure region where networking resources will be deployed.
- `vnet_address_space`: Address space for the Virtual Network (VNet).

### AKS Cluster Module
The cluster module accepts the following input variables:
- `aks_cluster_name`: Name of the AKS cluster to be created.
- `cluster_location`: Azure region where the AKS cluster will be deployed.
- `dns_prefix`: DNS prefix of the AKS cluster.
- `kubernetes_version`: Kubernetes version the cluster will use.
- `service_principal_client_id`: Client ID for the service principal associated with the cluster.
- `service_principal_secret`: Client Secret for the service principal associated with the cluster.
- `resource_group_name`: Name of the Azure Resource Group where networking resources are deployed.
- `vnet_id`: ID of the Virtual Network (VNet) where the AKS cluster will be connected.
- `control_plane_subnet_id`: ID of the control plane subnet within the VNet.
- `worker_node_subnet_id`: ID of the worker node subnet within the VNet.

## Output Variables
### AKS Cluster Module
After provisioning the AKS cluster, the following output variables are available:
- `aks_cluster_name`: Name of the provisioned AKS cluster.
- `aks_kubeconfig`: Kubernetes configuration file of the provisioned AKS cluster.


## Contributing
Contributions are welcome! Feel free to submit pull requests or raise issues if you encounter any problems.

## License
This project is licensed under the [MIT License](LICENSE).
