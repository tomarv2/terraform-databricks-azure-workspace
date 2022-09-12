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
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

## Terraform module for [Databricks Azure Workspace (Part 1)](https://registry.terraform.io/providers/databrickslabs/databricks/latest/docs/guides/azure-workspace)

> ❗️ **Important**
>
> :point_right: This Terraform module assumes you have logged into Azure using `az login` and have Contributor access to the subscription.
>
> :arrow_right:️ **Part 2:** Terraform module for [Databricks Workspace management](https://github.com/tomarv2/terraform-databricks-workspace-management)

<p align="center" width="100%">
    <img width="55%" src="https://github.com/tomarv2/terraform-databricks-azure-workspace/raw/main/docs/images/databricks_deployment.png">
</p>


## Versions

- Module tested for Terraform [1.1.4](https://www.terraform.io/downloads)
- `databrickslabs/databricks` provider version [0.4.6](https://registry.terraform.io/providers/databrickslabs/databricks/latest)
- Azure provider version [2.94.0](https://registry.terraform.io/providers/hashicorp/azurerm/latest).
- `main` branch: Provider versions may not be pinned to keep up with Terraform releases.
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

- Update examples directory with required values.

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

  resource_group_name         = "demo-rg"
  # ---------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

#### References

##### - Terraform module for [Databricks AWS Workspace](https://github.com/tomarv2/terraform-databricks-aws-workspace)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.21.1 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | 1.2.1 |
| <a name="requirement_external"></a> [external](#requirement\_external) | ~> 2.2 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.21.1 |
| <a name="provider_databricks.created_workspace"></a> [databricks.created\_workspace](#provider\_databricks.created\_workspace) | 1.2.1 |
| <a name="provider_external"></a> [external](#provider\_external) | ~> 2.2 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::git@github.com:tomarv2/terraform-azure-resource-group.git | v0.0.10 |

## Resources

| Name | Type |
|------|------|
| [azurerm_databricks_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace) | resource |
| [databricks_token.pat](https://registry.terraform.io/providers/databricks/databricks/1.2.1/docs/resources/token) | resource |
| [random_string.naming](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [external_external.current_user](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_parameters"></a> [custom\_parameters](#input\_custom\_parameters) | https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace | `any` | `null` | no |
| <a name="input_custom_tags"></a> [custom\_tags](#input\_custom\_tags) | Extra custom tags | `any` | `null` | no |
| <a name="input_customer_managed_key_enabled"></a> [customer\_managed\_key\_enabled](#input\_customer\_managed\_key\_enabled) | Is the workspace enabled for customer managed key encryption? If true this enables the Managed Identity for the managed storage account. Possible values are true or false. Defaults to false. This field is only valid if the Databricks Workspace sku is set to premium. Changing this forces a new resource to be created | `bool` | `false` | no |
| <a name="input_databricks_token_lifetime_seconds"></a> [databricks\_token\_lifetime\_seconds](#input\_databricks\_token\_lifetime\_seconds) | Validity of the databricks token in seconds | `number` | `86400` | no |
| <a name="input_deploy_resource_group"></a> [deploy\_resource\_group](#input\_deploy\_resource\_group) | feature flag to deploy this resource or not | `bool` | `false` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | Is the Databricks File System root file system enabled with a secondary layer of encryption with platform managed keys? Possible values are true or false. Defaults to false. This field is only valid if the Databricks Workspace sku is set to premium. Changing this forces a new resource to be created | `bool` | `false` | no |
| <a name="input_load_balancer_backend_address_pool_id"></a> [load\_balancer\_backend\_address\_pool\_id](#input\_load\_balancer\_backend\_address\_pool\_id) | Resource ID of the Outbound Load balancer Backend Address Pool for Secure Cluster Connectivity (No Public IP) workspace. Changing this forces a new resource to be created | `string` | `null` | no |
| <a name="input_managed_services_cmk_key_vault_key_id"></a> [managed\_services\_cmk\_key\_vault\_key\_id](#input\_managed\_services\_cmk\_key\_vault\_key\_id) | Customer managed encryption properties for the Databricks Workspace managed resources(e.g. Notebooks and Artifacts). Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_network_security_group_rules_required"></a> [network\_security\_group\_rules\_required](#input\_network\_security\_group\_rules\_required) | Does the data plane (clusters) to control plane communication happen over private link endpoint only or publicly? Possible values AllRules, NoAzureDatabricksRules or NoAzureServiceRules. Required when public\_network\_access\_enabled is set to false. Changing this forces a new resource to be created | `string` | `null` | no |
| <a name="input_prjid"></a> [prjid](#input\_prjid) | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Allow public access for accessing workspace. Set value to false to access workspace only via private link endpoint. Possible values include true or false. Defaults to true. Changing this forces a new resource to be created | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the resources are created | `string` | `"westus2"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group name | `string` | `null` | no |
| <a name="input_resource_group_settings"></a> [resource\_group\_settings](#input\_resource\_group\_settings) | n/a | `any` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial. Changing this can force a new resource to be created in some circumstances | `string` | `"standard"` | no |
| <a name="input_teamid"></a> [teamid](#input\_teamid) | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Specifies the name of the Databricks Workspace resource. Changing this forces a new resource to be created | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_databricks_host"></a> [databricks\_host](#output\_databricks\_host) | databricks workspace url |
| <a name="output_databricks_sku"></a> [databricks\_sku](#output\_databricks\_sku) | The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial. Changing this can force a new resource to be created in some circumstances |
| <a name="output_databricks_token"></a> [databricks\_token](#output\_databricks\_token) | Value of the newly-created token |
| <a name="output_databricks_token_lifetime_hours"></a> [databricks\_token\_lifetime\_hours](#output\_databricks\_token\_lifetime\_hours) | Token validity |
| <a name="output_databricks_workspace_id"></a> [databricks\_workspace\_id](#output\_databricks\_workspace\_id) | databricks workspace id |
| <a name="output_managed_resource_group_name"></a> [managed\_resource\_group\_name](#output\_managed\_resource\_group\_name) | databricks managed resource group name |
| <a name="output_nonsensitive_databricks_token"></a> [nonsensitive\_databricks\_token](#output\_nonsensitive\_databricks\_token) | Value of the newly-created token |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | databricks resource group name |
<!-- END_TF_DOCS -->
