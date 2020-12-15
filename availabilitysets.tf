//Start of Availability Set 1
  resource "azurerm_availability_set" "availset" {
    name                = var.availset1name
    location            = "eastus"
    resource_group_name = azurerm_resource_group.TESTlab.name
}
//End of Availibility Set 1
