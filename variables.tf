variable "email" {
  description = "email address to be used for tagging (suggestion: use group email address)"
}

variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "subscription_id" {}

variable "client_id" {}

variable "client_secret" {}

variable "tenant_id" {}

variable "rg_name" {
  description = "Resource group name"
}

variable "deploy_storage_account" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}


variable "stg_account_tier" {
  default = "Standard"
}

variable "account_replication_type" {
  default = "GRS"
}

variable "storage_account_location" {
  description = "Location of the Storage account"
  default = "westus"
}

variable "storage_account_name" {
    description = "Storage account name"
  default = null
}

variable "asq_names" {
  type = list(string)
  default = []
}

variable "container_names" {
  type = list(string)
  default = []
}

variable "container_access_type" {
  default = "private"
}

variable "get_sas_token" {
  default = true
}