variable "asq_names" {
  description = "List of names of the azure storage queues."
  type        = list(string)
}

variable "storage_account_name" {
  description = "The name of the azure storage account."
  default     = null
  type        = string
}
