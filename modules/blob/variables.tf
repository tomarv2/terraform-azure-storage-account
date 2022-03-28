variable "storage_account_name" {
  description = "The name of the azure storage account."
  default     = null
  type        = string
}

variable "blob_name" {
  description = "The name of the azure storage blob"
  default     = null
  type        = string
}

variable "type" {
  default     = "Block"
  description = "The type of the storage blob to be created. Possible values are Append, Block or Page. Changing this forces a new resource to be created."
  type        = string
}

variable "blob_source" {
  description = "An absolute path to a file on the local system."
  type        = string
}

variable "create_blob" {
  description = "Feature flag, true or false"
  default     = true
  type        = bool
}

variable "storage_container_name" {
  description = "The name of the azure storage container"
  type        = string
}
