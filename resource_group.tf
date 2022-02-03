resource "azurerm_resource_group" "this" {
  count = var.deploy_resource_group != null

  name     = var.resource_group_name != null ? var.resource_group_name : "${var.teamid}-${var.prjid}"
  location = var.region
  tags     = var.custom_tags != null ? merge(var.custom_tags, local.shared_tags) : merge(local.shared_tags)
}
