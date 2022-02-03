variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "region" {
  description = "default Azure region"
  type        = string
  default     = "westeurope"
}

variable "databricks_account_username" {
  description = "databricks account username"
  type        = string
}
variable "databricks_account_password" {
  description = "databricks account password"
  type        = string
}

variable "databricks_account_id" {
  description = "External ID provided by third party."
  type        = string
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 3
}

locals {
  suffix = random_string.naming.result
}

variable "resource_group_name" {
  description = "Resource Group name"
  default     = null
  type        = string
}

variable "workspace_name" {
  description = "Databricks workspace name"
  default     = null
  type        = string
}

variable "sku" {
  description = "Databricks sku"
  default     = "premium"
  type        = string
}


variable "subscription_id" {
  description = "Azure subscription Id"
  type        = string
}

variable "client_id" {
  description = "Azure client Id"
  type        = string
}

variable "client_secret" {
  description = "Azure client secret"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant Id"
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

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 3
}

locals {
  prefix = random_string.naming.result
}