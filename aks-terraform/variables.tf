# variables.tf aks-terraform 

# Define input variable for client_id
variable "client_id" {
  description = "The Client ID for Azure service principal authentication. This value is used to authenticate Terraform with Azure."
  default     = "your_client_id_here"
}

# Define input variable for client_secret
variable "client_secret" {
  description = "The Client Secret for Azure service principal authentication. This value is used to authenticate Terraform with Azure."
  default     = "your_client_secret_here"
}
