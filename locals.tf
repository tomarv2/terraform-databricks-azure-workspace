locals {
  shared_tags = tomap(
    {
      "Name"    = "${var.teamid}-${var.prjid}",
      "team"    = var.teamid,
      "project" = var.prjid,
      "Owner"   = lookup(data.external.current_user.result, "name")
    }
  )
}
