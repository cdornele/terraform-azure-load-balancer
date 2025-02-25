#--------------------------------------------*--------------------------------------------
# Module: Azure Load Balancer - Main
#--------------------------------------------*--------------------------------------------

resource "azurerm_public_ip" "this" {
  count                     = lower(var.lb_type == "public") ? 1 : 0
  name                      = data.azurecaf_name.public_ip.result
  resource_group_name       = var.resource_group_name
  location                  = var.location
  allocation_method         = var.public_ip_allocation_method
  sku                       = var.public_ip_sku
  ddos_protection_mode      = var.public_ip_ddos_protection_mode
  ddos_protection_plan_id   = var.public_ip_ddos_protection_plan_id
  edge_zone                 = var.public_ip_edge_zone
  idle_timeout_in_minutes   = var.public_ip_idle_timeout_in_minutes
  ip_version                = var.public_ip_ip_version
  public_ip_prefix_id       = var.public_ip_public_ip_prefix_id
  reverse_fqdn              = var.public_ip_reverse_fqdn
  sku_tier                  = var.public_ip_sku_tier
  zones                     = var.public_ip_zones
  tags                      = var.public_ip_tags
  
}

resource "azurerm_lb" "this" {
  name                = data.azurecaf_name.load_balancer.result
  resource_group_name = var.resource_group_name
  location            = var.location
  edge_zone           = var.lb_edge_zone
  sku                 = var.lb_sku
  sku_tier            = var.lb_sku_tier
  tags                = var.lb_tags

  frontend_ip_configuration {
    name                          = var.lb_frontend_name
    private_ip_address            = var.lb_frontend_private_ip_address
    private_ip_address_allocation = var.lb_frontend_private_ip_address_allocation
    private_ip_address_version    = var.lb_frontend_private_ip_address_version
    public_ip_address_id          = try(azurerm_public_ip.this[0].id, null)
    subnet_id                     = var.lb_frontend_private_subnet_id
    zones                         = var.lb_frontend_frontend_ip_zones
  }
}

resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = data.azurecaf_name.load_balancer_backend_address_pool.result
}

resource "azurerm_lb_nat_rule" "this" {
  count                         = length(var.lb_nat_remote_port)

  backend_port                   = element(var.lb_nat_remote_port[element(keys(var.lb_nat_remote_port), count.index)], 1)
  frontend_ip_configuration_name = var.lb_frontend_name
  loadbalancer_id                = azurerm_lb.this.id
  name                           = "VM-${count.index}"
  protocol                       = "Tcp"
  resource_group_name            = var.resource_group_name
  frontend_port                  = "5000${count.index + 1}"
}

resource "azurerm_lb_probe" "this" {
  count                         = length(var.lb_probe)

  loadbalancer_id               = azurerm_lb.this.id
  name                          = element(keys(var.lb_probe), count.index)
  port                          = element(var.lb_probe[element(keys(var.lb_probe), count.index)], 1)
  interval_in_seconds           = var.lb_probe_interval
  number_of_probes              = var.lb_probe_unhealthy_threshold
  protocol                      = element(var.lb_probe[element(keys(var.lb_probe), count.index)], 0)
  request_path                  = element(var.lb_probe[element(keys(var.lb_probe), count.index)], 2)
}

resource "azurerm_lb_rule" "azlb" {
  count                          = length(var.lb_port)

  backend_port                   = element(var.lb_port[element(keys(var.lb_port), count.index)], 2)
  frontend_ip_configuration_name = var.lb_frontend_name
  frontend_port                  = element(var.lb_port[element(keys(var.lb_port), count.index)], 0)
  loadbalancer_id                = azurerm_lb.this.id
  name                           = element(keys(var.lb_port), count.index)
  protocol                       = element(var.lb_port[element(keys(var.lb_port), count.index)], 1)
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.this.id]
  disable_outbound_snat          = var.lb_disable_outbound_snat
  enable_floating_ip             = var.lb_floating_ip_enabled
  idle_timeout_in_minutes        = 5
  probe_id                       = element(azurerm_lb_probe.this[*].id, count.index)
}


# end
#--------------------------------------------*--------------------------------------------