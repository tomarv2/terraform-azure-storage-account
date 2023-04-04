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
    <a href="https://twitter.com/intent/follow?screen_name=tomar_v2" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/tomar_v2?style=social&logo=twitter"></a>
</p>

# Terraform module for [Azure Storage Account](https://registry.terraform.io/modules/tomarv2/storage-account/azure/latest)

> :arrow_right:  Terraform module for [AWS S3](https://registry.terraform.io/modules/tomarv2/s3/aws/latest)

> :arrow_right:  Terraform module for [Google Storage](https://registry.terraform.io/modules/tomarv2/storage-bucket/google/latest)

## Versions

- Module tested for Terraform 1.0.1.
- Azure provider version [3.21.1](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
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

#### Recommended method (stores remote state in storage using `prjid` and `teamid` to create directory structure):

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

**NOTE:**

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

### [Authenticate with Azure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

Terraform supports a number of different methods for authenticating to Azure:

- Authenticating to Azure using the Azure CLI
- Authenticating to Azure using Managed Service Identity
- Authenticating to Azure using a Service Principal and a Client Certificate
- Authenticating to Azure using a Service Principal and a Client Secret

#### Storage Account

```
terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 3.21.1"
    }
  }
}

provider "azurerm" {
  features {}
}

module "account" {
  source = "../../modules/account"

  storage_accounts_config = {
    "demostorageaccount" = {
      resource_group  = "<resource_group_name>"
      location        = "westus2"
      min_tls_version = "TLS1_0"
    }
  }
  teamid = var.teamid
  prjid  = var.prjid
}
```

#### Storage Account with ASQ, Container and Blob


Please refer to examples directory [link](examples) for references.
