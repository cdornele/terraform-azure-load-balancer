#--------------------------------------------*--------------------------------------------
# Module: Azure Load Balancer - Variables
#--------------------------------------------*--------------------------------------------
variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
}

variable "prefixes" {
  description = "The prefixes to use for the naming convention."
  type        = list(string)
  default     = []
}

variable "suffixes" {
  description = "The suffixes to use for the naming convention."
  type        = list(string)
  default     = []
}

# public_ip

variable "public_ip_stack" {
  description = "The stack name to use for the public IP."
  type        = string
  
}

variable "public_ip_allocation_method" {
  description = "The allocation method for the public IP address."
  type        = string
  default     = "Static"
}

variable "public_ip_sku" {
  description = "The SKU of the Public IP."
  type        = string
  default     = "Standard"
}

variable "public_ip_ddos_protection_mode" { 
  description = "The DDoS protection mode of the Public IP."
  type        = string
  default     = "Disabled"
}

variable "public_ip_ddos_protection_plan_id" {
  description = "The DDoS protection plan ID of the Public IP."
  type        = string
  default     = null
}

variable "public_ip_edge_zone" {
  description = "The Edge Zone of the Public IP."
  type        = string
  default     = null
}

variable "public_ip_idle_timeout_in_minutes" {
  description = "The idle timeout in minutes of the Public IP."
  type        = number
  default     = 4
}

variable "public_ip_ip_version" {
  description = "The IP version of the Public IP."
  type        = string
  default     = "IPv4"
}

variable "public_ip_public_ip_prefix_id" {
  description = "The Public IP Prefix ID of the Public IP."
  type        = string
  default     = null
}

variable "public_ip_reverse_fqdn" {
  description = "The reverse FQDN of the Public IP."
  type        = string
  default     = null
}

variable "public_ip_sku_tier" {
  description = "The Tier of the Public IP SKU."
  type        = string
  default     = "Regional"
}

variable "public_ip_zones" {
  description = "The availability zones of the Public IP."
  type        = list(string)
  default     = ["1","2","3"]
}

variable "public_ip_tags" {
  description = "The tags to associate with the Public IP."
  type        = map(string)
  default     = {}
}

# load_balancer

variable "lb_stack" {
  description = "The stack name to use for the load balancer."
  type        = string
}

variable "lb_type" {
  description = "The type of load balancer to create."
  type        = string
  default     = "private"
}

variable "lb_edge_zone" {
  description = "The Edge Zone of the Load Balancer."
  type        = string
  default     = null
}

variable "lb_sku" {
  description = "The SKU of the Load Balancer."
  type        = string
  default     = "Standard"
}

variable "lb_sku_tier" {
  description = "The Tier of the Load Balancer SKU."
  type        = string
  default     = "Regional"
}

variable "lb_tags" {
  description = "The tags to associate with the Load Balancer."
  type        = map(string)
  default     = {}
}

variable "lb_frontend_name" {
  description = "The name of the frontend IP configuration."
  type        = string
  default     = "frontend"
}

variable "lb_frontend_private_ip_address" {
  description = "The private IP address of the frontend IP configuration."
  type        = string
  default     = null
}

variable "lb_frontend_private_ip_address_allocation" {
  description = "The private IP address allocation method of the frontend IP configuration."
  type        = string
  default     = "Dynamic"
}

variable "lb_frontend_private_ip_address_version" {
  description = "The private IP address version of the frontend IP configuration."
  type        = string
  default     = "IPv4"
}

variable "lb_frontend_private_subnet_id" {
  description = "The subnet ID of the frontend IP configuration."
  type        = string
  default     = null
}

variable "lb_frontend_frontend_ip_zones" {
  description = "The availability zones of the frontend IP configuration."
  type        = list(string)
  default     = null
}

variable "lb_nat_remote_port" {
  description = "The remote port of the NAT rule. [protocol, backend_port].  Frontend port will be automatically generated starting at 50000 and in the output."
  type        = map(any)
  default     = {}
}

variable "lb_probe" {
  description = "The probe settings for the Load Balancer."
  type        = map(any)
  default     = {}
}

variable "lb_probe_interval" {
  description = "The interval of the probe."
  type        = number
  default     = 5
}

variable "lb_probe_unhealthy_threshold" {
  description = "The unhealthy threshold of the probe."
  type        = number
  default     = 3
}

variable "lb_port" {
  description = "The port settings for the Load Balancer."
  type        = map(any)
  default     = {}
}

variable "lb_disable_outbound_snat" {
  description = "Disable outbound SNAT for the Load Balancer."
  type        = bool
  default     = false
}

variable "lb_floating_ip_enabled" {
  description = "Enable floating IP for the Load Balancer."
  type        = bool
  default     = false
}

# end
#--------------------------------------------*--------------------------------------------