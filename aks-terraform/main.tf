# main.tf aks-terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Define the Azure provider block
provider "azurerm" {
    features {}
    client_id = var.client_id
    client_secret = var.client_secret
    subscription_id = "8ab233ac-c619-4888-bf7a-422ea867b8d8"
    tenant_id = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}

# Integrate the networking module
module "networking" {
    source = "./modules/networking-module"
    # Provide input variables for the networking module
    resource_group_name = "networking-resource-group"
    location = "UK South"
    vnet_address_space = ["10.0.0.0/16"]
}

module "aks_cluster" {
    source = "./modules/aks-cluster-module" # Path to the cluster module directory
    
    # Provide input variables for the cluster module
    aks_cluster_name = "terraform-aks-cluster"
    cluster_location = "UK South"
    dns_prefix = "myaks-project"
    kubernetes_version = "1.26.6"
    service_principal_client_id = var.client_id
    service_principal_secret = var.client_secret

    # Use output variables from the networking module for other input variables
    resource_group_name = module.networking.networking_resource_group_name
    vnet_id = module.networking.vnet_id
    control_plane_subnet_id = module.networking.control_plane_subnet_id
    worker_node_subnet_id = module.networking.worker_node_subnet_id
}





























