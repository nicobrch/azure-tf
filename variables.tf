variable "subscription_id" {
  description = "Azure subscription ID used by the AzureRM provider"
  type        = string
}

variable "environment" {
  description = "Deployment environment tag value"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, prod."
  }
}

variable "location" {
  description = "Azure region where the resource group will be created"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-students-terraform"
}

variable "tags" {
  description = "Additional tags to apply to the resource group"
  type        = map(string)
  default     = {}
  nullable    = false
}
