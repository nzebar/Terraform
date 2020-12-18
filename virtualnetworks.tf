//Deployment of 1 Virtual Network

resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1name
  location            = azurerm_resource_group.TESTlab.location
  resource_group_name = azurerm_resource_group.TESTlab.name
  address_space       = var.vnet1addressspace
}

//Deployment of 2 Virtual Subnets.
//Each Subnet will have 2 Network Security Groups

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
    source_address_prefix      = ""
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
    destination_address_prefix = ""
    }

    security_rule {
    name                       = "nsg2HTTPsubnet1in"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = ""
    destination_address_prefix = "10.11.1.16"
    }

    security_rule {
    name                       = "nsg2HTTPsubnet1out"
    priority                   = 120
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = "10.11.1.16"
    destination_address_prefix = ""
    }
  }
  
resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2name
  resource_group_name  = azurerm_resource_group.TESTlab.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.subnet2addressprefix
}

   resource "azurerm_network_security_group" "nsgsubnet2" {
    name                = "nsgsubnet2"
    location            = azurerm_resource_group.TESTlab.location
    resource_group_name = azurerm_resource_group.TESTlab.name

    security_rule {
    name                       = "nsg1RDPsubnet2in"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = ""
    destination_address_prefix = "10.11.1.16"
    }

    security_rule {
    name                       = "nsg1RDPsubnet2out"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = "10.11.1.16"
    destination_address_prefix = ""
    }

    security_rule {
    name                       = "nsg2HTTPsubnet2in"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = ""
    destination_address_prefix = "10.11.1.16"
    }

    security_rule {
    name                       = "nsg2HTTPsubnet2out"
    priority                   = 120
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = "10.11.1.16"
    destination_address_prefix = ""
    }
  }
 
//Deployment of 2 Network Security Group to Subnets Associations.
//Each Subnet will have 1 Network Security Group Associations.

resource "azurerm_subnet_network_security_group_association" "nsg1subnet1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsgsubnet1.id
}

 resource "azurerm_subnet_network_security_group_association" "nsg1subnet2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsgsubnet2.id
}

