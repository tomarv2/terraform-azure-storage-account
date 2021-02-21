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

variable "rg_name" {}

variable "add_storage_account" {
  default = false
}

variable "stg_account_tier" {
  default = "Standard"
}

variable "account_replication_type" {
  default = "GRS"
}

variable "storage_account_location" {
  description = "Location of the Storage account"
}

variable "storage_account_name" {
}

variable "asq_names" {
  type = list(string)
}

variable "container_names" {
  type = list(string)
}

variable "container_access_type" {
  default = "private"
}

//variable "stg_depends_on" {
//  default = null
//}