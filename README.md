<p align="center">
    <a href="https://github.com/tomarv2/terraform-databricks-azure-workspace/actions/workflows/pre-commit.yml" alt="Pre Commit">
        <img src="https://github.com/tomarv2/terraform-databricks-azure-workspace/actions/workflows/pre-commit.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-databricks-azure-workspace" /></a>
    <a href="https://github.com/tomarv2/terraform-databricks-azure-workspace/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-databricks-azure-workspace" /></a>
    <a href="https://github.com/tomarv2/terraform-databricks-azure-workspace/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-databricks-azure-workspace" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://discord.gg/XH975bzN" alt="chat on Discord">
        <img src="https://img.shields.io/discord/813961944443912223?logo=discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

## Terraform module for [Databricks Azure Workspace (Part 1)](https://registry.terraform.io/providers/databrickslabs/databricks/latest/docs/guides/azure-workspace)

> ❗️ **Important**
>
> :point_right: This Terraform module assumes you have access to: [https://accounts.cloud.databricks.com](https://accounts.cloud.databricks.com)
>
> :point_right: Databricks account username: `databricks_account_username`
>
> :point_right: Databricks account password: `databricks_account_password`
>
> :point_right: Databricks account id, `databricks_account_id` can be found on the top right corner of the page, once you're logged in.
>
> :point_right: Part 2: Terraform module for [Databricks Workspace management](https://github.com/tomarv2/terraform-databricks-workspace-management)

---
![Databricks deployment](https://github.com/tomarv2/terraform-databricks-azure-workspace/raw/main/docs/images/databricks_deployment.png)
---

## Versions

- Module tested for Terraform [1.1.4](https://www.terraform.io/downloads)
- `databrickslabs/databricks` provider version [0.4.6](https://registry.terraform.io/providers/databrickslabs/databricks/latest)
- Azure provider version [2.94.0](https://registry.terraform.io/providers/hashicorp/azurerm/latest).
- `main` branch: Provider versions not pinned to keep up with Terraform releases.
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-databricks-azure-workspace/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-databricks-azure-workspace" /></a>).

---
## Usage

### Option 1:

```
terrafrom init
terraform plan -var='teamid=tryme' -var='prjid=project1'
terraform apply -var='teamid=tryme' -var='prjid=project1'
terraform destroy -var='teamid=tryme' -var='prjid=project1'
```
**Note:** With this option please take care of remote state storage

### Option 2:

#### Recommended method (stores remote state in S3 using `prjid` and `teamid` to create directory structure):

- Create python 3.6+ virtual environment
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote --upgrade
```

- Set below environment variables:
```
export TF_AZURE_STORAGE_ACCOUNT=tfstatexxxxx # Output of remote_state.sh
export TF_AZURE_CONTAINER=tfstate # Output of remote_state.sh
export ARM_ACCESS_KEY=xxxxxxxxxx # Output of remote_state.sh
```

- Update [main.tf](examples/azure_databricks_new_vnet/main.tf) file with required values.

- Run and verify the output before deploying:
```
tf -c=azure plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:
```
tf -c=azure apply -var='teamid=foo' -var='prjid=bar'
```

- Run below to destroy:
```
tf -c=azure destroy -var='teamid=foo' -var='prjid=bar'
```

**NOTE:**

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

### Databricks workspace creation
```
module "databricks_workspace" {
  source = "git::git@github.com:tomarv2/terraform-databricks-azure-workspace.git"

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  resource_group_name         = "demo-rg"
  # ---------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.
