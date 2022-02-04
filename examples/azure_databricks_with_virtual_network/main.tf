module "vnet" {
  source = "git@github.com:tomarv2/terraform-azure-virtual-network.git?ref=v0.0.2"

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

  resource_group_name = "demo-resource_group"
  custom_parameters = {
    virtual_network_id = module.vnet.virtual_network_id
  }
  # ---------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
