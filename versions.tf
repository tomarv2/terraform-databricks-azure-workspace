terraform {
  required_version = ">= 1.0.1"
  required_providers {
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
    external = {
      version = "~> 2.2"
    }
  }
}

provider "azurerm" {
  features {}
}
