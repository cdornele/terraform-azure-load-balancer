#--------------------------------------------*--------------------------------------------
# Example: Azure Load Balancer - Internal Load Balancer
#--------------------------------------------*--------------------------------------------

provider "azurerm" {
  features {}
}

module "resource_group-example" {
  source   = "cdornele/resource-group/azure"
  version  = "1.0.0"
  stack    = "example"
  suffixes = ["t", "01"]
  location = "eastus2"
  tags = {
    "environement" = "example"
    "workload"     = "example"
    "owner"        = "example"
  }
}

module "network-example" {
  source  = "cdornele/network-spoke/azure"
  version = "2.0.1"
  global_settings = {
    name     = "example"
    suffixes = ["t", "01"]
  }
  settings = {
    address_space = ["192.168.0.0/24"]
    subnet_settings = {
      subnets = {
        frontend = {
          name             = "app"
          suffixes         = ["t", "01"]
          address_prefixes = ["192.168.0.0/28"]
          nsg_key          = "application-nsg"
          rts_key          = "application-rts"
        }
      }
    }
    network_security_group_settings = {
      empty_nsg = {}
      application-nsg = {
        name     = "app"
        suffixes = ["t", "01"]
        rules = [
          {
            name                       = "allow-http-inbound",
            priority                   = "100"
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "80"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
            description                = "Allow inbound HTTP traffic example"
          }
        ]
      }
    }
    route_tables_settings = {
      application-rts = {
        is_Enabled = false
        name       = "app"
        suffixes   = ["prod", "01"]
      }
    }
  }
  resource_group = module.resource_group-example.name
  location       = module.resource_group-example.location
  tags           = module.resource_group-example.tags
}

module "load-balancer-example" {
  source                        = "../.."
  resource_group_name           = module.resource_group-example.name
  location                      = module.resource_group-example.location
  lb_type                       = "private"
  public_ip_stack               = "example"
  lb_stack                      = "example"
  suffixes                      = ["t", "01"]
  lb_frontend_private_subnet_id = module.network-example.subnets[0].frontend.subnet_id
  public_ip_tags                = module.resource_group-example.tags
  lb_tags                       = module.resource_group-example.tags
  lb_probe = {
    http = ["Tcp", "80", ""]
  }
  lb_port = {
    http = ["80", "Tcp", "80"]
  }
}

## outputs

output "public_ip_id" {
  description = "The ID of the Public IP Address"
  value       = module.load-balancer-example.public_ip_id
}

output "public_ip_address" {
  description = "The Public IP Address"
  value       = module.load-balancer-example.public_ip_address
}

output "load_balancer_id" {
  description = "The ID of the Load Balancer"
  value       = module.load-balancer-example.load_balancer_id
}

output "load_balancer_name" {
  description = "The Name of the Load Balancer"
  value       = module.load-balancer-example.load_balancer_name
}


output "load_balancer_backend_address_pool_id" {
  description = "The ID of the Load Balancer Backend Address Pool"
  value       = module.load-balancer-example.load_balancer_backend_address_pool_id
}

output "load_balancer_frontend_ip_configuration" {
  description = "The Frontend IP Configuration of the Load Balancer"
  value       = module.load-balancer-example.load_balancer_frontend_ip_configuration
}


# end
#--------------------------------------------*--------------------------------------------