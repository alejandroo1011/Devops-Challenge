#Referencias 
#https://spacelift.io/blog/terraform-azure-devops 
#https://registry.terraform.io/providers/hashicorp/Azurerm/latest/docs/data-sources/container_registry
#https://github.com/hashicorp/terraform-provider-azurerm/issues/21766
#https://spacelift.io/blog/terraform-null-resource


provider "azurerm" {
  features {}
}

variable "namespace" {
  default = "namespace1"
}

variable "source_acr_name" {
  type        = string
  default     = "reference.azurecr.io"
}

variable "destination_acr_name" {
  type        = string
  default     = "instance.azurecr.io"
}

variable "resource_group_name" {
  type        = string
}

#Añadimos el ID
variable "subscription_id" {
  type        = string
  default     = "c9e7611c-d508-4-f-aede-0bedfabc1560"
}

data "azurerm_container_registry" "source_acr" {
  name = var.source_acr_name
  resource_group_name = var.resource_group_name
}

data "azurerm_container_registry" "destination_acr" {
  name = var.destination_acr_name
  resource_group_name = var.resource_group_name
}


# Copiar el Helm chart del ACR

resource "null_resource" "copy_helm_chart" {
  provisioner "local-exec" {
    command = <<EOT
      # Descargar Helm chart del ACR de origen
      helm pull ${var.source_acr_name}/challenge2 --version 1.0.0
      # Autenticar en ACR
      az acr login --name ${data.azurerm_container_registry.destination_acr.name}
      # Subir el Helm chart al ACR de destino
      helm push ./challenge2-1.0.0.tgz ${var.destination_acr_name}
    EOT
  }
}
