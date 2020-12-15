resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1name
  location            = azurerm_resource_group.TESTlab.location
  resource_group_name = azurerm_resource_group.TESTlab.name
  address_space       = var.vnet1addressspace
}

resource "azurerm_subnet" "subnet1" {
  name                 = azurerm_virtual_network.vnet1.name
  resource_group_name  = azurerm_resource_group.TESTlab.name
  virtual_network_name = var.vnet1name
  address_prefixes     = var.subnet1addressprefix
}

resource "azurerm_subnet" "subnet2" {
  name                 = azurerm_virtual_network.vnet1.name
  resource_group_name  = azurerm_resource_group.TESTlab.name
  virtual_network_name = var.vnet1name
  address_prefixes     = var.subnet2addressprefix
}

resource "azurerm_subnet" "subnet3" {
  name                 = azurerm_virtual_network.vnet1.name
  resource_group_name  = azurerm_resource_group.TESTlab.name
  virtual_network_name = var.vnet1name
  address_prefixes     = var.subnet3addressprefix
}