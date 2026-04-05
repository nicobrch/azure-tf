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

resource "azurerm_cognitive_deployment" "chat_model" {
  cognitive_account_id = azurerm_cognitive_account.foundry.id
  name                 = var.openai_deployment_name

  model {
    format  = "OpenAI"
    name    = var.openai_model_name
    version = var.openai_model_version
  }

  sku {
    capacity = var.openai_deployment_capacity
    name     = var.openai_deployment_sku_name
  }
}

resource "azurerm_cognitive_deployment" "embedding_model" {
  cognitive_account_id = azurerm_cognitive_account.foundry.id
  name                 = var.embedding_deployment_name

  model {
    format  = "OpenAI"
    name    = var.embedding_model_name
    version = var.embedding_model_version
  }

  sku {
    capacity = var.embedding_deployment_capacity
    name     = var.embedding_deployment_sku_name
  }
}

moved {
  from = azurerm_cognitive_deployment.openai_model
  to   = azurerm_cognitive_deployment.embedding_model
}
