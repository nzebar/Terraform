resource "azurerm_lb" "LB1" {
  name                = var.LB1name
  location            = "eastus"
  sku                 = "Standard"
  resource_group_name = azurerm_resource_group.TESTlab.name

  frontend_ip_configuration {
    name                 = "LB1pubIPAddress"
    public_ip_address_id = azurerm_public_ip.LB1pubIP.id
  }
}

resource "azurerm_lb_probe" "LB1probe" {
  resource_group_name = azurerm_resource_group.TESTlab.name
  loadbalancer_id     = azurerm_lb.LB1.id
  name                = "HTTPS-running-probe"
  port                = 443
  interval_in_seconds = "86400"
  number_of_probes = "5"
}

resource "azurerm_lb_outbound_rule" "LB1outboundrule1" {
  resource_group_name     = azurerm_resource_group.TESTlab.name
  loadbalancer_id         = azurerm_lb.LB1.id
  name                    = "LB1outboundrule1"
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.LB1backendPool1.id
  

  frontend_ip_configuration {
    name = "LB1pubIPAddress"
  }
}

resource "azurerm_public_ip" "LB1pubIP" {
  name                = var.LB1pubIPname
  location            = "eastus"
  resource_group_name = azurerm_resource_group.TESTlab.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "contosoenterpise"
}

resource "azurerm_lb_backend_address_pool" "LB1backendPool1" {
  resource_group_name = azurerm_resource_group.TESTlab.name
  loadbalancer_id     = azurerm_lb.LB1.id
  name                = "LB1backendPool1"
}
    
resource "azurerm_lb_rule" "LB1rule1RDP" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB1.id
  name                           = "LB1accessRDP"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "LB1pubIPAddress"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.LB1backendPool1.id
  disable_outbound_snat   = "true"
}    

resource "azurerm_lb_rule" "LB1rule1HTTP" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB1.id
  name                           = "LB1rule1HTTP"
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 443
  frontend_ip_configuration_name = "LB1pubIPAddress"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.LB1backendPool1.id
  disable_outbound_snat   = "true"
}    

resource "azurerm_lb_nat_rule" "LB1natrule1" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB1.id
  name                           = "RDPAccessVM1356"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "LB1pubIPAddress"
}

    resource "azurerm_network_interface_nat_rule_association" "LB1natruleVM1356interface1Assoc" {
        network_interface_id  = azurerm_network_interface.VM1356interface1.id
        ip_configuration_name = "VM1356internalIP"
        nat_rule_id           = azurerm_lb_nat_rule.LB1natrule1.id
    }
  
  resource "azurerm_lb_nat_rule" "LB1natrule2" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB1.id
  name                           = "HTTPAccessVM1356"
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 443
  frontend_ip_configuration_name = "LB1pubIPAddress"
}

    resource "azurerm_network_interface_nat_rule_association" "LB1natruleVM1356interface1Assoc1" {
        network_interface_id  = azurerm_network_interface.VM1356interface1.id
        ip_configuration_name = "VM1356internalIP"
        nat_rule_id           = azurerm_lb_nat_rule.LB1natrule3.id
    }












resource "azurerm_lb" "LB2" {
  name                = var.LB2name
  location            = "eastus"
  sku                 = "Standard"
  resource_group_name = azurerm_resource_group.TESTlab.name

  frontend_ip_configuration {
    name                 = "LB2pubIPAddress"
    public_ip_address_id = azurerm_public_ip.LB2pubIP.id
  }
}
resource "azurerm_lb_probe" "LB2probe" {
  resource_group_name = azurerm_resource_group.TESTlab.name
  loadbalancer_id     = azurerm_lb.LB2.id
  name                = "HTTPS-running-probe"
  port                = 443
  interval_in_seconds = "86400"
  number_of_probes = "5"
}

resource "azurerm_lb_outbound_rule" "LB2outboundrule1" {
  resource_group_name     = azurerm_resource_group.TESTlab.name
  loadbalancer_id         = azurerm_lb.LB2.id
  name                    = "LB2outboundrule1"
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.LB2backendPool1.id
  

  frontend_ip_configuration {
    name = "LB2pubIPAddress"
  }
}

resource "azurerm_public_ip" "LB2pubIP" {
  name                = var.LB2pubIPname
  location            = "eastus"
  resource_group_name = azurerm_resource_group.TESTlab.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "mailcontosoenterpise"
}

resource "azurerm_lb_backend_address_pool" "LB2backendPool1" {
  resource_group_name = azurerm_resource_group.TESTlab.name
  loadbalancer_id     = azurerm_lb.LB2.id
  name                = "LB2backendPool1"
}
    
resource "azurerm_lb_rule" "LB2rule1RDP" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB2.id
  name                           = "LB2accessRDP"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "LB2pubIPAddress"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.LB2backendPool1.id
  disable_outbound_snat   = "true"
}    

resource "azurerm_lb_rule" "LB2rule1HTTP" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB2.id
  name                           = "LB2rule1HTTP"
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 443
  frontend_ip_configuration_name = "LB2pubIPAddress"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.LB2backendPool1.id
  disable_outbound_snat   = "true"
}   

resource "azurerm_lb_nat_rule" "LB2natrule1" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB2.id
  name                           = "RDPAccessVM2356"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "LB2pubIPAddress"
}

    resource "azurerm_network_interface_nat_rule_association" "LB1natruleVM2356interface1Assoc" {
        network_interface_id  = azurerm_network_interface.VM2356interface1.id
        ip_configuration_name = "VM2356internalIP"
        nat_rule_id           = azurerm_lb_nat_rule.LB2natrule1.id
    }
  
  resource "azurerm_lb_nat_rule" "LB2natrule2" {
  resource_group_name            = azurerm_resource_group.TESTlab.name
  loadbalancer_id                = azurerm_lb.LB2.id
  name                           = "HTTPAccessVM2356"
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 443
  frontend_ip_configuration_name = "LB2pubIPAddress"
}

    resource "azurerm_network_interface_nat_rule_association" "LB1natruleVM2356interface1Assoc1" {
        network_interface_id  = azurerm_network_interface.VM2356interface1.id
        ip_configuration_name = "VM2356internalIP"
        nat_rule_id           = azurerm_lb_nat_rule.LB2natrule2.id
    }