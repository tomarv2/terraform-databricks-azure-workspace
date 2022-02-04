variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "region" {
  description = " The region where the resources are created"
  type        = string
  default     = "westus2"
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 3
}

locals {
  prefix = random_string.naming.result
}

variable "resource_group_name" {
  description = "Resource Group name"
  default     = null
  type        = string
}

variable "workspace_name" {
  description = "Specifies the name of the Databricks Workspace resource. Changing this forces a new resource to be created"
  default     = null
  type        = string
}

variable "sku" {
  description = "The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial. Changing this can force a new resource to be created in some circumstances"
  default     = "standard"
  type        = string
}

variable "custom_tags" {
  type        = any
  description = "Extra custom tags"
  default     = null
}

variable "deploy_resource_group" {
  description = "feature flag to deploy this resource or not"
  type        = bool
  default     = false
}

variable "infrastructure_encryption_enabled" {
  description = "Is the Databricks File System root file system enabled with a secondary layer of encryption with platform managed keys? Possible values are true or false. Defaults to false. This field is only valid if the Databricks Workspace sku is set to premium. Changing this forces a new resource to be created"
  default     = false
  type        = bool
}

variable "public_network_access_enabled" {
  description = "Allow public access for accessing workspace. Set value to false to access workspace only via private link endpoint. Possible values include true or false. Defaults to true. Changing this forces a new resource to be created"
  default     = true
  type        = bool
}

variable "custom_parameters" {
  description = "https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace"
  type        = any
  default     = null
}

variable "customer_managed_key_enabled" {
  description = "Is the workspace enabled for customer managed key encryption? If true this enables the Managed Identity for the managed storage account. Possible values are true or false. Defaults to false. This field is only valid if the Databricks Workspace sku is set to premium. Changing this forces a new resource to be created"
  default     = false
  type        = bool
}

variable "load_balancer_backend_address_pool_id" {
  description = "Resource ID of the Outbound Load balancer Backend Address Pool for Secure Cluster Connectivity (No Public IP) workspace. Changing this forces a new resource to be created"
  default     = null
  type        = string
}

variable "managed_services_cmk_key_vault_key_id" {
  description = "Customer managed encryption properties for the Databricks Workspace managed resources(e.g. Notebooks and Artifacts). Changing this forces a new resource to be created."
  default     = null
  type        = string
}

variable "network_security_group_rules_required" {
  description = "Does the data plane (clusters) to control plane communication happen over private link endpoint only or publicly? Possible values AllRules, NoAzureDatabricksRules or NoAzureServiceRules. Required when public_network_access_enabled is set to false. Changing this forces a new resource to be created"
  default     = null
  type        = string
}

variable "databricks_token_lifetime_seconds" {
  description = "Validity of the databricks token in seconds"
  default     = 86400
  type        = number
}
