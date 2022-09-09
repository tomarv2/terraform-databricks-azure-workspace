module "azure_databricks" {
  source = "../../"

  resource_group_settings = [
    {
      name     = "demo1"
      location = "westus2"
  }]
  # ---------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

provider "azurerm" {
  features {}
}
