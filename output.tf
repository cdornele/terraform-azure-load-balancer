#--------------------------------------------*--------------------------------------------
# Module: Azure Load Balancer - Outputs
#--------------------------------------------*--------------------------------------------

output "public_ip_id" {
  description = "The ID of the Public IP Address"
  value       = lower(var.lb_type == "public") ? azurerm_public_ip.this[0].id : null
}

output "public_ip_address" {
  description = "The Public IP Address"
  value       = lower(var.lb_type == "public") ? azurerm_public_ip.this[0].ip_address : null
}

output "load_balancer_id" {
  description = "The ID of the Load Balancer"
  value       = azurerm_lb.this.id
}

output "load_balancer_name" {
  description = "The Name of the Load Balancer"
  value       = azurerm_lb.this.name
}

output "load_balancer_backend_address_pool_id" {
  description = "The ID of the Load Balancer Backend Address Pool"
  value       = azurerm_lb_backend_address_pool.this.id
 
}

output "load_balancer_frontend_ip_configuration" {
  description = "The Frontend IP Configuration of the Load Balancer"
  value       = azurerm_lb.this.frontend_ip_configuration[0].name
}

output "load_balancer_nat_rule_ids" {
  description = "The IDs of the Load Balancer NAT Rules"
  value       = azurerm_lb_nat_rule.this[*].id
}

output "load_balancer_probe_ids" {
  description = "The IDs of the Load Balancer Probes"
  value       = azurerm_lb_probe.this[*].id
}


# end
#--------------------------------------------*--------------------------------------------