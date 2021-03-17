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
  default     = "westus"
}

variable "storage_account_name" {
  description = "Storage account name"
  default     = null
}

variable "asq_names" {
  type    = list(string)
  default = []
}

variable "container_names" {
  type    = list(string)
  default = null
}

variable "blob_name" {
  default = null
}

variable "container_access_type" {
  default = "private"
}

variable "get_sas_token" {
  default = true
}

variable "network_rules" {
  default = []
  type = set(object({
    default_action             = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  }))
}

//variable "queue_properties" {
////    default = {}
//  type = set(object({
//    logging = object({})
////    delete                = string
////    retention_policy_days = string
////    read                  = string
////    version               = string
////    write                 = string
//  }))
//}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2 (contrary to AZ default option)"
  default     = "TLS1_2"
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
  default     = ""
}

variable "create_blob" {
  description = "feature flag, true or false"
  default     = false
  type        = bool
}

variable "container_name_for_blob" {
  default = ""
}