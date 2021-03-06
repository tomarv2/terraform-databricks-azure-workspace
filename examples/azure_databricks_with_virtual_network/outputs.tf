output "resource_group_name" {
  description = "Resource Group name"
  value       = module.azure_databricks.resource_group_name
}

output "databricks_host" {
  description = "Databricks hosts"
  value       = module.azure_databricks.databricks_host
}

output "databricks_workspace_id" {
  description = "Databricks workspace id"
  value       = module.azure_databricks.databricks_workspace_id
}

output "databricks_managed_resource_group_name" {
  description = "Databricks managed_resource group name"
  value       = module.azure_databricks.managed_resource_group_name
}

output "databricks_sku" {
  description = "The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial. Changing this can force a new resource to be created in some circumstances"
  value       = module.azure_databricks.databricks_sku
}
