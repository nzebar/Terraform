resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1name
  location            = azurerm_resource_group.TESTlab.location
  resource_group_name = azurerm_resource_group.TESTlab.name
  address_space       = var.vnet1addressspace
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1name
  resource_group_name  = azurerm_resource_group.TESTlab.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.subnet1addressprefix
}

  resource "azurerm_network_security_group" "nsgsubnet1" {
    name                = "nsgsubnet1"
    location            = azurerm_resource_group.TESTlab.location
    resource_group_name = azurerm_resource_group.TESTlab.name

    security_rule {
    name                       = "nsg1RDPsubnet1in"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = "40.76.154.212"
    destination_address_prefix = "10.11.1.16"
    }

    security_rule {
    name                       = "nsg1RDPsubnet1out"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = "10.11.1.16"
    destination_address_prefix = "40.76.154.212"
    }
  }
  

 resource "azurerm_subnet_network_security_group_association" "nsg1subnet1AssocRDPin" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsgsubnet1.id
}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2name
  resource_group_name  = azurerm_resource_group.TESTlab.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.subnet2addressprefix
}
