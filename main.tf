# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

## Resource group                                

resource "azurerm_resource_group" "terraform-terrified-rg" {
  name     = "terraform-terrified-rg"
  location = "UK South"

  tags = {
    environment = "demo"
  }
}
