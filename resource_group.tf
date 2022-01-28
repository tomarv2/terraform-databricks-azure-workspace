resource "azurerm_resource_group" "this" {
  count = var.deploy_rg != null

  name     = var.rg_name != null ? var.rg_name : "${var.teamid}-${var.prjid}"
  location = var.region
  tags     = var.custom_tags != null ? merge(var.custom_tags, local.shared_tags) : merge(local.shared_tags)
}
