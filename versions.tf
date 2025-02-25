#--------------------------------------------*--------------------------------------------
# Module: Azure Load Balancer - Versions
#--------------------------------------------*--------------------------------------------

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "> 4.10"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "2.0.0-preview3"
    }
  }
}

# end
#--------------------------------------------*--------------------------------------------