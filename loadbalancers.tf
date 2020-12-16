// Deployment of LB1 with 2 frontend Config.

resource "azurerm_lb" "LB1" {
  name                = var.LB1name
  location            = "eastus"
  sku                 = "Standard"
  resource_group_name = azurerm_resource_group.TESTlab.name

  frontend_ip_configuration {
    name                 = "LB1pubIPAddress1356"
    public_ip_address_id = azurerm_public_ip.LB1pubIP1356.id
  }
  frontend_ip_configuration {
    name                 = "LB1pubIPAddress2356"
    public_ip_address_id = azurerm_public_ip.LB1pubIP2356.id
  }
}

//Deployment of 2 Public IPs. 1 to each frontend config in LB1.

resource "azurerm_public_ip" "LB1pubIP1356" {
  name                = "LB1pubIP1356"
  resource_group_name = azurerm_resource_group.TESTlab.name
  location            = azurerm_resource_group.TESTlab.location
  allocation_method   = "Static"
  sku = "standard"
  domain_name_label   = "contosoenterprise"
}

resource "azurerm_public_ip" "LB1pubIP2356" {
  name                = "LB1pubIP12356"
  resource_group_name = azurerm_resource_group.TESTlab.name
  location            = azurerm_resource_group.TESTlab.location
  allocation_method   = "Static"
  sku = "standard"
  domain_name_label   = "mailcontosoenterprise"
}

//Deployment of 2 Backend Address Pools for LB1

resource "azurerm_lb_backend_address_pool" "LB1backendPool1356" {
  resource_group_name = azurerm_resource_group.TESTlab.name
  loadbalancer_id     = azurerm_lb.LB1.id
  name                = "LB1backendPool1356"
}

resource "azurerm_lb_backend_address_pool" "LB1backendPool2356" {
  resource_group_name = azurerm_resource_group.TESTlab.name
  loadbalancer_id     = azurerm_lb.LB1.id
  name                = "LB1backendPool2356"
}

//Deployment of 2 Outbound Rules. 1 for each frontend config in LB1. 
//Each outbound rule has 1 Backend Address Pool.

resource "azurerm_lb_outbound_rule" "LB1outboundrule1356" {
  resource_group_name     = azurerm_resource_group.TESTlab.name
  loadbalancer_id         = azurerm_lb.LB1.id
  name                    = "LB1outboundrule1356"
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.LB1backendPool1356.id

  frontend_ip_configuration {
    name = "LB1pubIPAddress1356"
  }
}

resource "azurerm_lb_outbound_rule" "LB1outboundrule2356" {
  resource_group_name     = azurerm_resource_group.TESTlab.name
  loadbalancer_id         = azurerm_lb.LB1.id
  name                    = "LB1outboundrule2356"
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.LB1backendPool2356.id

  frontend_ip_configuration {
    name = "LB1pubIPAddress2356"
  }
}

//Deployment of 4 inbound NAT rules for LB1.
//Each Backend Address Pool has 2 Inbound NAT rules.

resource "azurerm_lb_nat_rule" "LB1natrule11356" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB1.id
  name                           = "RDPnaterule1VM1356"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "LB1pubIPAddress1356"
}

resource "azurerm_lb_nat_rule" "LB1natrule21356" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB1.id
  name                           = "HTTPnatrule1AccessVM1356"
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 443
  frontend_ip_configuration_name = "LB1pubIPAddress1356"
}

resource "azurerm_lb_nat_rule" "LB1natrule12356" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB1.id
  name                           = "RDPnatrule1VM2356"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "LB1pubIPAddress2356"
}

resource "azurerm_lb_nat_rule" "LB1natrule22356" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB1.id
  name                           = "HTTPnatrule2VM2356"
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 443
  frontend_ip_configuration_name = "LB1pubIPAddress2356"
}

//Deployment of 4 Network Interface to Inbound NAT rule Associations.
//Each Network Interface will have 2 Inbound NAT rule Associations.

resource "azurerm_network_interface_nat_rule_association" "LB1natrule113561InterfaceAssociation" {
        network_interface_id  = azurerm_network_interface.VM1356interface1.id
        ip_configuration_name = "VM1356internalIP"
        nat_rule_id           = azurerm_lb_nat_rule.LB1natrule11356.id
    }

resource "azurerm_network_interface_nat_rule_association" "LB1natrule21356Interface1Association" {
        network_interface_id  = azurerm_network_interface.VM1356interface1.id
        ip_configuration_name = "VM1356internalIP"
        nat_rule_id           = azurerm_lb_nat_rule.LB1natrule21356.id
    }

resource "azurerm_network_interface_nat_rule_association" "LB1natrule12356Interface1Association" {
        network_interface_id  = azurerm_network_interface.VM2356interface1.id
        ip_configuration_name = "VM2356internalIP"
        nat_rule_id           = azurerm_lb_nat_rule.LB1natrule12356.id
    }

resource "azurerm_network_interface_nat_rule_association" "LB1natrule22356Interface1Association" {
        network_interface_id  = azurerm_network_interface.VM2356interface1.id
        ip_configuration_name = "VM2356internalIP"
        nat_rule_id           = azurerm_lb_nat_rule.LB1natrule22356.id
    }


