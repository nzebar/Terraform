//Start of Availability Set 1
  resource "azurerm_availability_set" "avset1" {
    name                = var.avset1name
    location            = "eastus"
    resource_group_name = azurerm_resource_group.TESTlab.name
}
//End of Availibility Set 1

//Start of Availability Set 2
  resource "azurerm_availability_set" "avset2" {
    name                = var.avset2name
    location            = "eastus"
    resource_group_name = azurerm_resource_group.TESTlab.name
}
//End of Availibility Set 1
