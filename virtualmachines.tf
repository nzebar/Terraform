//Start of VM1356 Deployment
    resource "azurerm_windows_virtual_machine" "VM1356" {
    name                = var.VM1356name
    resource_group_name = azurerm_resource_group.TESTlab.name
    location            = azurerm_resource_group.TESTlab.location
    size                = var.VM1356size
    admin_username      = var.VM1356adminusername
    admin_password      = var.VM1356adminpassword
    network_interface_ids = [azurerm_network_interface.VM1356interface1.id,]
    availability_set_id = azurerm_availability_set.avset1.id

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2016-Datacenter"
        version   = "latest"
        }
    }

    resource "azurerm_network_interface" "VM1356interface1" {
    name                = var.VM1356interface1name
    location            = azurerm_resource_group.TESTlab.location
    resource_group_name = azurerm_resource_group.TESTlab.name
    virtual_machine_id =  azurerm_windows_virtual_machine.VM1356.id


    ip_configuration {
        name                          = "VM1356internalIP"
        subnet_id                     = azurerm_subnet.subnet1.id
        private_ip_address = "10.11.1.16/32"
        private_ip_address_allocation = "static"
        }
    }

    resource "azurerm_network_interface_backend_address_pool_association" "VM1356interface1Assoc" {
        network_interface_id    = azurerm_network_interface.VM1356interface1.id
        ip_configuration_name   = azurerm_network_interface.VM1356interface1.name
        backend_address_pool_id = azurerm_lb_backend_address_pool.LB1backendPool1.id
        }
//End of VM1356 Deployment


//Start of VM2356 Deployment
    resource "azurerm_windows_virtual_machine" "VM2356" {
    name                = var.VM2356name
    resource_group_name = azurerm_resource_group.TESTlab.name
    location            = azurerm_resource_group.TESTlab.location
    size                = var.VM2356size
    admin_username      = var.VM2356adminusername
    admin_password      = var.VM2356adminpassword
    network_interface_ids = [
        azurerm_network_interface.VM2356interface1.id,]
    availability_set_id = azurerm_availability_set.avset2.id

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2016-Datacenter"
        version   = "latest"
        }
    }

    resource "azurerm_network_interface" "VM2356interface1" {
    name                = var.VM2356interface1name
    location            = azurerm_resource_group.TESTlab.location
    resource_group_name = azurerm_resource_group.TESTlab.name
     virtual_machine_id =  azurerm_windows_virtual_machine.VM2356.id

    ip_configuration {
        name                          = "VM2356internalIP"
        subnet_id                     = azurerm_subnet.subnet2.id
        private_ip_address = "10.11.2.32/32"
        private_ip_address_allocation = "static"
        }
    }

    resource "azurerm_network_interface_backend_address_pool_association" "VM2356interface1Assoc" {
        network_interface_id    = azurerm_network_interface.VM2356interface1.id
        ip_configuration_name   = azurerm_network_interface.VM2356interface1.name
        backend_address_pool_id = azurerm_lb_backend_address_pool.LB1backendPool1.id
        }
//End of VM2356 Deployment

