output "web_vm_ids" {
  value = azurerm_linux_virtual_machine.web[*].id
}

output "db_vm_id" {
  value = azurerm_linux_virtual_machine.db.id
}
