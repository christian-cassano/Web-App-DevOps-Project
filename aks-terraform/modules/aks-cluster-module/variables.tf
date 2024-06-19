# variables.tf aks-cluster-module 

variable "aks_cluster_name" {
  description = "Name of the AKS cluster to be created."
  type        = string
}

variable "cluster_location" {
  description = "Azure region where the AKS cluster will be deployed."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix of the AKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version the cluster will use."
  type        = string
}

variable "service_principal_client_id" {
  description = "Client ID for the service principal associated with the cluster."
  type        = string
}

variable "service_principal_secret" {
  description = "Client Secret for the service principal associated with the cluster."
  type        = string
}

# Input variables from the networking module
variable "resource_group_name" {
  description = "Name of the Azure Resource Group where networking resources are deployed."
  type        = string
}

variable "vnet_id" {
  description = "ID of the Virtual Network (VNet) where the AKS cluster will be connected."
  type        = string
}

variable "control_plane_subnet_id" {
  description = "ID of the control plane subnet within the VNet."
  type        = string
}

variable "worker_node_subnet_id" {
  description = "ID of the worker node subnet within the VNet."
  type        = string
}

