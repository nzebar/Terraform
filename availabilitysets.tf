resource "azurerm_availability_set" "avs1" {
  name                = "avs1"
  location            = azurerm_resource_group.RecGroupTestlab.location
  resource_group_name = azurerm_resource_group.RecGroupTestlab.name

  
}