output "asq_names" {
  description = "List of names of the azure storage queues."
  value = {
    for asq in azurerm_storage_queue.asq :
    asq.id => asq.name
  }
}
