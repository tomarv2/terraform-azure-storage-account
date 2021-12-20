<p align="center">
    <a href="https://github.com/tomarv2/terraform-azure-storage-account/actions/workflows/pre-commit.yml" alt="Pre Commit">
        <img src="https://github.com/tomarv2/terraform-azure-storage-account/actions/workflows/pre-commit.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-azure-storage-account" /></a>
    <a href="https://github.com/tomarv2/terraform-azure-storage-account/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-azure-storage-account" /></a>
    <a href="https://github.com/tomarv2/terraform-azure-storage-account/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-azure-storage-account" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://discord.gg/XH975bzN" alt="chat on Discord">
        <img src="https://img.shields.io/discord/813961944443912223?logo=discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

# Terraform module to create [Azure Storage Account](https://registry.terraform.io/modules/tomarv2/storage-account/azure/latest)

> :arrow_right:  Terraform module for [AWS S3](https://registry.terraform.io/modules/tomarv2/s3/aws/latest)

> :arrow_right:  Terraform module for [Google Storage](https://registry.terraform.io/modules/tomarv2/storage-bucket/google/latest)

## Versions

- Module tested for Terraform 1.0.1.
- Azure provider version [2.90.0](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-azure-storage-account/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-azure-storage-account" /></a> in your releases)

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

- Create python 3.8+ virtual environment
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

- Updated `examples` directory to required values.

- Run and verify the output before deploying:
```
tf -cloud azure plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:
```
tf -cloud azure apply -var='teamid=foo' -var='prjid=bar'
```

- Run below to destroy:
```
tf -cloud azure destroy -var='teamid=foo' -var='prjid=bar'
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
**NOTE:**

- Read more on [tfremote](https://github.com/tomarv2/tfremote)
---

#### Storage Account

```
module "storage_account" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/account"

  rg_name = "test-rg"
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

#### Storage Account with ASQ, Container and Blob

```
module "storage_account" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/account"

  rg_name = "test-rg"
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_container" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/container"

  storage_account_name = module.account.storage_account_name
  container_names = ["test1", "test2"]
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_queue" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/queue"

  storage_account_name = module.account.storage_account_name
  asq_names = ["test1-asq", "test2-asq"]
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_blob" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/blob"

  storage_account_name = module.account.storage_account_name
  storage_container_name = "<existing container name>"
  blob_name = "test-blob"
  blob_source = "<source file name>"
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.
