output "storage_account_name" {
  value = azurerm_storage_account.terraform.name
}

output "container_name" {
  value = azurerm_storage_container.tfstate.name
}
