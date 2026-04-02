# Azure Resource Group with Terraform

This repository creates a single Azure resource group using Terraform and AzureRM provider best practices.

## Prerequisites

- Terraform 1.7+
- Azure CLI
- An Azure subscription (Azure for Students is supported)

## 1. Authenticate to Azure

```bash
az login
az account show
```

If the wrong subscription is selected, switch it:

```bash
az account set --subscription "<your-subscription-id>"
```

## 2. Configure Terraform variables

Create a local variables file from the example:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` and set your real `subscription_id` plus any optional values.

## 3. Initialize and deploy

```bash
terraform init
terraform plan -out tfplan
terraform apply tfplan
```

## Troubleshooting: Azure Resource Provider registration

This project sets `resource_provider_registrations = "none"` in the AzureRM provider to avoid permission issues common in constrained subscriptions (including many student subscriptions).

If you later need to deploy additional resource types and hit an unregistered provider error, register the specific provider with Azure CLI (if your role allows it), for example:

```bash
az provider register --namespace Microsoft.Resources
```

## 4. Clean up

```bash
terraform destroy
```

## File layout

- `terraform.tf`: Terraform and provider version constraints
- `providers.tf`: Azure provider configuration
- `variables.tf`: Input variables
- `locals.tf`: Shared local values
- `main.tf`: Azure resource definitions
- `outputs.tf`: Output values
