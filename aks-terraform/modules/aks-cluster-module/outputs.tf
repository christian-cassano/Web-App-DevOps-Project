# outputs.tf aks-cluster-module

output "aks_cluster_name" {
  description = "The name of the provisioned AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "aks_kubeconfig" {
  description = "The Kubernetes configuration file of the provisioned AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config
}
