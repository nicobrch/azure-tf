resource "azurerm_resource_group" "main" {
  location = var.location
  name     = var.resource_group_name
  tags     = local.default_tags
}

resource "azurerm_cognitive_account" "foundry" {
  custom_subdomain_name         = local.foundry_account_name
  kind                          = "OpenAI"
  location                      = var.foundry_location
  name                          = local.foundry_account_name
  public_network_access_enabled = true
  resource_group_name           = azurerm_resource_group.main.name
  sku_name                      = "S0"
  tags                          = local.default_tags
}
