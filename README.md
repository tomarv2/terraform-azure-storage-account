# Azure Storage Account and ASQ module

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | ~> 2.21 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 2.21 |

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
