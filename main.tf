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

resource "azurerm_resource_group" "terraform-demo-rg" {
  name     = "Terraform-Demo-RG"
  location = "West Europe"
}

                              
# Generate random text for a unique storage account name
resource "random_id" "randomId" {
    keepers = {
        resource_group = azurerm_resource_group.terraform-demo-rg.name
    }    
    byte_length = 3
}

## Create Storage Account using Local and Unique ID                               

resource "azurerm_storage_account" "storageaccount" {
  name                      = "terraform${random_id.randomId.hex}"
  resource_group_name       = azurerm_resource_group.terraform-demo-rg.name
  location                  = "West Europe"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  account_kind              = "StorageV2"
 }
