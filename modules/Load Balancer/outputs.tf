output "lb_public_ip_address" {
  value = azurerm_public_ip.lb_public_ip.ip_address
}

output "lb_backend_address_pool_id" {
  value = azurerm_lb_backend_address_pool.web_lb_pool.id
}
