variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "storage_accounts_config" {
  description = "Storage account settings"
  type        = map(any)
}

variable "network_rules" {
  description = "Network rules restricting access to the storage account."
  default     = []
  type = set(object({
    default_action             = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  }))
}

variable "extra_tags" {
  description = "Additional tags to associate"
  type        = map(string)
  default     = {}
}

variable "managed_identity_type" {
  description = "The type of Managed Identity which should be assigned to the Linux Virtual Machine. Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned`"
  default     = null
  type        = string
}

variable "managed_identity_ids" {
  description = "A list of User Managed Identity ID's which should be assigned to the Linux Virtual Machine."
  default     = null
  type        = list(string)
}