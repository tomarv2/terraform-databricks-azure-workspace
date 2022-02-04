module "azure_databricks" {
  source = "../../"

  resource_group_name = "demo-resource_group"
  # ---------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
