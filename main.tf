data "azurerm_client_config" "current" {
}

data "external" "current_user" {
  program = ["az", "account", "show", "--query", "user"]
}

module "resource_group" {
  source = "git::git@github.com:tomarv2/terraform-azure-resource-group.git?ref=v0.0.3"

  deploy_resource_group = var.deploy_resource_group != false ? true : false
  resource_group_name   = var.resource_group_name != null ? var.resource_group_name : "${var.teamid}-${var.prjid}"

  # ------------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
