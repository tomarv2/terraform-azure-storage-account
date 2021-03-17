output "asq_names" {
  value = {
    for asq in azurerm_storage_queue.asq:
    asq.id => asq.name
  }
}
