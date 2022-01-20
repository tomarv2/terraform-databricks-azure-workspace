<p align="center">
    <a href="https://github.com/tomarv2/terraform-template/actions/workflows/security_scans.yml" alt="Security Scans">
        <img src="https://github.com/tomarv2/terraform-template/actions/workflows/security_scans.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-template" /></a>
    <a href="https://github.com/tomarv2/terraform-template/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-template" /></a>
    <a href="https://github.com/tomarv2/terraform-template/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-template" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://discord.gg/XH975bzN" alt="chat on Discord">
        <img src="https://img.shields.io/discord/813961944443912223?logo=discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

# Terraform module to create Google

# Versions

- Module tested for Terraform 1.0.1.
- Google provider version [3.58.0](https://registry.terraform.io/providers/hashicorp/google/latest).
- `main` branch: Provider versions not pinned to keep up with Terraform releases.
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-template/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-template" /></a> in your releases).

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote).

## Usage

Recommended method:

- Create python 3.8+ virtual environment. 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_GCLOUD_BUCKET=<remote state bucket name>
export TF_GCLOUD_CREDENTIALS=<gcp credentials.json>
```  

- Updated `examples` directory with required values.

- Run and verify the output before deploying:
```
tf -cloud gcloud plan 
```

- Run below to deploy:
```
tf -cloud gcloud apply 
```

- Run below to destroy:
```
tf -cloud gcloud destroy
```

> ❗️ **Important** - Two variables are required for using `tf` package:
>
> - teamid
> - prjid
>
> These variables are required to set backend path in the remote storage.
> Variables can be defined using:
>
> - As `inline variables` e.g.: `-var='teamid=demo-team' -var='prjid=demo-project'`
> - Inside `.tfvars` file e.g.: `-var-file=<tfvars file location> `
>
> For more information refer to [Terraform documentation](https://www.terraform.io/docs/language/values/variables.html)

#### Storage Bucket(with optional enable website)
```
module "storage_bucket" {
  source = "../"

  deploy_bucket = true

  gcp_project                 = "demo-1000"
  uniform_bucket_level_access = true
  versioning                  = false
  enable_website              = false # NOTE: enable_website and enable_cors go togeather
  enable_cors                 = false  # enable_cors is dependent on enable_website
  # -----------------------------------
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

## Requirements


## Permissions

Service account with the following roles is required:

- [`roles/storage.admin`](https://cloud.google.com/iam/docs/understanding-roles#cloud-storage-roles)

## Project APIs

Following APIs must be enabled on the project:
- `storage-api.googleapis.com`
