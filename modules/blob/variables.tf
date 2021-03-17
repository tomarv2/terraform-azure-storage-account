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

variable "blob_name" {
  default = null
}

variable "type" {
  default     = "Block"
  description = "The type of the storage blob to be created. Possible values are Append, Block or Page. Changing this forces a new resource to be created."
}

variable "size" {
  default     = "Block"
  description = "The type of the storage blob to be created. Possible values are Append, Block or Page. Changing this forces a new resource to be created."
}

variable "blob_source" {
  description = "An absolute path to a file on the local system."
}

variable "create_blob" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "storage_container_name" {
}