locals {
  default_tags = merge(
    {
      Environment = var.environment
      ManagedBy   = "terraform"
    },
    var.tags
  )

  foundry_account_name = substr(lower("aoai${replace(var.subscription_id, "-", "")}"), 0, 24)
}
