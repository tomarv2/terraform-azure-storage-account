output "storage_container_names" {
  description = "List of names of the azure storage containers."
  value = {
    for container in azurerm_storage_container.container :
    container.id => container.name
  }
}
