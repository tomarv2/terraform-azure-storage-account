variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription Id"
  type        = string
}

variable "client_id" {
  description = "Azure client Id"
  type        = string
}

variable "client_secret" {
  description = "Azure client secret"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant Id"
  type        = string
}

variable "rg_name" {
  description = "The name of the azure storage account(A container that holds related resources)"
  type        = string
}

variable "deploy_storage_account" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "stg_account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  default     = "Standard"
  type        = string
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa."
  default     = "GRS"
  type        = string
}

variable "storage_account_location" {
  description = "The location/region for storage account. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "westus"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the azure storage account"
  default     = null
  type        = string
}

variable "get_sas_token" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "network_rules" {
  description = "Network rules restricing access to the storage account."
  default     = []
  type = set(object({
    default_action             = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  }))
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2 (contrary to AZ default option)"
  default     = "TLS1_2"
  type        = string
}

variable "enable_https_traffic_only" {
  description = "Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true."
  default     = true
  type        = bool
}
