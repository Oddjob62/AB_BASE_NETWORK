provider "azurerm" {
  version = "~> 2.0"
  features {}
}

provider "azuread" {
  version = "=0.7.0"
}

resource "azurerm_resource_group" "AB_DEMO_NETWORK_RG" {
  name     = var.resourceGroupName
  location = var.location
}

resource "azurerm_virtual_network" "demoVnet" {
  name                = "ab_demo_vnet_00"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.AB_DEMO_NETWORK_RG.location
  resource_group_name = azurerm_resource_group.AB_DEMO_NETWORK_RG.name
}

resource "azurerm_subnet" "service" {
  name                 = "ab_service_subnet"
  resource_group_name  = azurerm_resource_group.AB_DEMO_NETWORK_RG.name
  virtual_network_name = azurerm_virtual_network.demoVnet.name
  address_prefixes     = ["10.0.1.0/24"]

  enforce_private_link_service_network_policies = true
}

resource "azurerm_subnet" "endpoint" {
  name                 = "ab_endpoint_subnet"
  resource_group_name  = azurerm_resource_group.AB_DEMO_NETWORK_RG.name
  virtual_network_name = azurerm_virtual_network.demoVnet.name
  address_prefixes     = ["10.0.2.0/24"]

  enforce_private_link_endpoint_network_policies = true
}

