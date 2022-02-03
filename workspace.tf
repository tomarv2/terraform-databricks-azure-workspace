resource "azurerm_databricks_workspace" "this" {
  name                                  = var.workspace_name != null ? var.workspace_name : "${var.teamid}-${var.prjid}"
  resource_group_name                   = var.deploy_resource_group != false ? join("", module.resource_group.*.resource_group_name) : var.resource_group_name
  location                              = var.region
  sku                                   = var.sku
  managed_resource_group_name           = "${local.prefix}-workspace-rg"
  infrastructure_encryption_enabled     = var.infrastructure_encryption_enabled
  customer_managed_key_enabled          = var.customer_managed_key_enabled
  load_balancer_backend_address_pool_id = var.load_balancer_backend_address_pool_id
  managed_services_cmk_key_vault_key_id = var.managed_services_cmk_key_vault_key_id
  public_network_access_enabled         = var.public_network_access_enabled
  network_security_group_rules_required = var.network_security_group_rules_required
  dynamic "custom_parameters" {
    for_each = var.custom_parameters != null ? [var.custom_parameters] : []
    content {
      machine_learning_workspace_id                        = lookup(custom_parameters.value, "machine_learning_workspace_id", null)
      nat_gateway_name                                     = lookup(custom_parameters.value, "nat_gateway_name", null)
      public_ip_name                                       = lookup(custom_parameters.value, "public_ip_name", null)
      no_public_ip                                         = lookup(custom_parameters.value, "no_public_ip", null)
      public_subnet_name                                   = lookup(custom_parameters.value, "public_subnet_name", null)
      public_subnet_network_security_group_association_id  = lookup(custom_parameters.value, "public_subnet_network_security_group_association_id", null)
      private_subnet_name                                  = lookup(custom_parameters.value, "private_subnet_name", null)
      private_subnet_network_security_group_association_id = lookup(custom_parameters.value, "private_subnet_network_security_group_association_id", null)
      storage_account_name                                 = lookup(custom_parameters.value, "storage_account_name", null)
      storage_account_sku_name                             = lookup(custom_parameters.value, "storage_account_sku_name", null)
      virtual_network_id                                   = lookup(custom_parameters.value, "virtual_network_id", null)
      vnet_address_prefix                                  = lookup(custom_parameters.value, "vnet_address_prefix", null)

    }
  }
  tags = var.custom_tags != null ? merge(var.custom_tags, local.shared_tags) : local.shared_tags
}
