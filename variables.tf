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

variable "foundry_location" {
  description = "Azure region where the Azure OpenAI (Foundry) account will be created"
  type        = string
  default     = "eastus2"

  validation {
    condition = contains([
      "brazilsouth",
      "canadacentral",
      "centralus",
      "eastus2",
      "mexicocentral"
    ], var.foundry_location)
    error_message = "Foundry location must be one of the policy-allowed regions: brazilsouth, canadacentral, centralus, eastus2, mexicocentral."
  }
}

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-students-terraform"
}

variable "openai_deployment_capacity" {
  description = "Capacity units for the OpenAI model deployment"
  type        = number
  default     = 10
}

variable "openai_deployment_name" {
  description = "Name of the Azure OpenAI model deployment"
  type        = string
  default     = "gpt-5-4-nano"
}

variable "openai_deployment_sku_name" {
  description = "SKU name for the Azure OpenAI model deployment"
  type        = string
  default     = "GlobalStandard"
}

variable "openai_model_name" {
  description = "Azure OpenAI model name to deploy"
  type        = string
  default     = "gpt-5.4-nano"
}

variable "openai_model_version" {
  description = "Azure OpenAI model version to deploy"
  type        = string
  default     = "2026-03-17"
}

variable "embedding_deployment_capacity" {
  description = "Capacity units for the embedding model deployment"
  type        = number
  default     = 1
}

variable "embedding_deployment_name" {
  description = "Name of the Azure OpenAI embedding model deployment"
  type        = string
  default     = "text-embedding-3-small"
}

variable "embedding_deployment_sku_name" {
  description = "SKU name for the Azure OpenAI embedding deployment"
  type        = string
  default     = "Standard"
}

variable "embedding_model_name" {
  description = "Azure OpenAI embedding model name to deploy"
  type        = string
  default     = "text-embedding-3-small"
}

variable "embedding_model_version" {
  description = "Azure OpenAI embedding model version to deploy"
  type        = string
  default     = "1"
}

variable "tags" {
  description = "Additional tags to apply to the resource group"
  type        = map(string)
  default     = {}
  nullable    = false
}
