resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
}

resource "azurerm_lb" "web_lb" {
  name                = "web-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "web_lb_pool" {
  name                = "web-lb-backend-pool"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.web_lb.id
}

resource "azurerm_lb_probe" "http_probe" {
  name                = "http-probe"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.web_lb.id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "http_lb_rule" {
  name                           = "http-lb-rule"
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.web_lb.id
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  backend_address_pool_id        = azurerm_lb_backend_address_pool.web_lb_pool.id
  probe_id                       = azurerm_lb_probe.http_probe.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  enable_floating_ip             = false
  idle_timeout_in_minutes        = 4
  load_distribution              = "Default"
}
