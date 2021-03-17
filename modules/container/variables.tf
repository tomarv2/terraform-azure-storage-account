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

variable "storage_account_name" {
  description = "Storage account name"
  default     = null
}

variable "container_names" {
  type    = list(string)
  default = null
}

variable "container_access_type" {
  default = "private"
}
