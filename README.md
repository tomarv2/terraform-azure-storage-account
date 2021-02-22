[![](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)
# Azure Storage Account

Terraform to creates Storage Accounts.

## Versions

- Module tested for Terraform 0.14.
- Azure provider version [2.48.0](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use latest tag in your releases)

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Usage

Recommended method:

- Create python 3.6+ virtual environment 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_AZURE_STORAGE_ACCOUNT=tfstatexxxxx # Output of remote_state.sh
export TF_AZURE_CONTAINER=tfstate # Output of remote_state.sh
export ARM_ACCESS_KEY=xxxxxxxxxx # Output of remote_state.sh
```  

- Update:
```
example/custom/sample.tfvars
```

- Change to: 
```
example/base
``` 

- Run and verify the output before deploying:
```
tf -cloud aws plan -var-file <path to .tfvars file>
```

- Run below to deploy:
```
tf -cloud aws apply -var-file <path to .tfvars file>
```

- Run below to destroy:
```
tf -cloud aws destroy -var-file <path to .tfvars file>
```

Please refer to example directory [link](example/README.md) for references.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_replication\_type | n/a | `string` | `"GRS"` | no |
| add\_storage\_account | n/a | `bool` | `false` | no |
| asq\_names | n/a | `list(string)` | n/a | yes |
| client\_id | n/a | `any` | n/a | yes |
| client\_secret | n/a | `any` | n/a | yes |
| container\_access\_type | n/a | `string` | `"private"` | no |
| container\_names | n/a | `list(string)` | n/a | yes |
| email | Email address to be used to for tagging. | `any` | n/a | yes |
| prjid | Name of the project/stack e.g: mystack, nifieks. Should not be changed after running 'tf apply'. | `any` | n/a | yes |
| rg\_name | n/a | `any` | n/a | yes |
| stg\_account\_tier | n/a | `string` | `"Standard"` | no |
| storage\_account\_location | Location of the Storage account | `any` | n/a | yes |
| storage\_account\_name | n/a | `any` | `null` | no |
| subscription\_id | n/a | `any` | n/a | yes |
| teamid | Name of the team or group e.g. devops, dataengineering. Should not be changed after running 'tf apply'. | `any` | n/a | yes |
| tenant\_id | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| asq\_names | n/a |
| storage\_account\_location | storage account location. |
| storage\_account\_name | storage account name. |
| storage\_account\_primary\_connection\_string | storage account primary connection string. |
| storage\_container\_names | n/a |
