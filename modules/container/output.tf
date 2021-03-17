output "storage_container_names" {
  value = {
    for container in azurerm_storage_container.container :
    container.id => container.name
  }
}
