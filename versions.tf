terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azure = {
      version = "~> 2.33"
    }
    azurerm = {
      version = "~> 2.94"
    }
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.3.5"
    }
    random = {
      version = "~> 3.1"
    }
    time = {
      version = "~> 0.7"
    }
    external = {
      version = "~> 2.2"
    }
  }
}

provider "databricks" {
  host     = "https://accounts.cloud.databricks.com"
  username = var.databricks_account_username
  password = var.databricks_account_password
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
