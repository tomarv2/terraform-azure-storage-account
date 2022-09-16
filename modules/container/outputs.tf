output "storage_container_names" {
  description = "Azure contrainer con."
  value = {
    for container in azurerm_storage_container.container :
    container.id => container.name
  }
}
