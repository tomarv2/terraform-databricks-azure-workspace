module "vnet" {
  source = "git::git@github.com:tomarv2/terraform-azure-virtual-network.git?ref=v0.0.2"

  resource_group_name = "demo-resource_group"
  location            = "westus2"
  cidr_block          = ["10.7.7.0/24"]
  # ---------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "azure_databricks" {
  source = "../../"

  custom_parameters = {
    virtual_network_id = module.vnet.virtual_network_id
  }
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
