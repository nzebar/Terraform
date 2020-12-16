//Deployment of 1 Resource Group.

resource "azurerm_resource_group" "TESTlab" {
    name = var.rg1name
    location = var.rg1location
    }


