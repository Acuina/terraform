resource "random_string" "storage_account_name" {
  length  = 24
  special = false
  upper   = false
}

resource "azurerm_storage_account" "terraform" {
  name                     = random_string.storage_account_name.result
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.terraform.name
  container_access_type = "private"
}
