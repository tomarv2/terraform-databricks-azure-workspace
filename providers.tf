terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 3.21.1"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "1.2.1"
    }
    random = {
      version = "~> 3.1"
    }
    external = {
      version = "~> 2.2"
    }
  }
}
