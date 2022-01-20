terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.63.0"
    }
    azurerm = {
      version = ">= 2.48"
    }
    google = {
      version = ">= 3.58"
    }
  }
}

provider "aws" {
  # Configuration options
}

# NOTE: Noticed an issue with getting access to Azure even after setting env.
# variables, adding it to mitigate auth issues.
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}
