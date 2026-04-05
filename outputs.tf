output "resource_group_id" {
  description = "ID of the created Azure resource group"
  value       = azurerm_resource_group.main.id
}

output "resource_group_name" {
  description = "Name of the created Azure resource group"
  value       = azurerm_resource_group.main.name
}

output "foundry_account_endpoint" {
  description = "Endpoint of the Azure OpenAI account"
  value       = azurerm_cognitive_account.foundry.endpoint
}

output "foundry_account_name" {
  description = "Name of the Azure OpenAI account"
  value       = azurerm_cognitive_account.foundry.name
}

output "openai_deployment_name" {
  description = "Name of the Azure OpenAI chat model deployment"
  value       = azurerm_cognitive_deployment.chat_model.name
}

output "embedding_deployment_name" {
  description = "Name of the Azure OpenAI embedding model deployment"
  value       = azurerm_cognitive_deployment.embedding_model.name
}
