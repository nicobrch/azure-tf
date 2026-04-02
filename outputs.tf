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
