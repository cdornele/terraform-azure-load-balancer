#--------------------------------------------*--------------------------------------------
# Module: Azure Load Balancer - Naming
#--------------------------------------------*--------------------------------------------

data "azurecaf_name" "public_ip" {
  name          = var.public_ip_stack
  resource_type = "azurerm_public_ip"
  prefixes      = var.prefixes
  suffixes      = var.suffixes
  use_slug      = true
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "load_balancer" {
  name          = var.lb_stack
  resource_type = "azurerm_lb"
  prefixes      = var.prefixes
  suffixes      = var.suffixes
  use_slug      = true
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "load_balancer_backend_address_pool" {
  name          = var.lb_stack
  resource_type = "azurerm_lb_backend_address_pool"
  prefixes      = var.prefixes
  suffixes      = var.suffixes
  use_slug      = true
  clean_input   = true
  separator     = "-"
  
}

# end
#--------------------------------------------*--------------------------------------------