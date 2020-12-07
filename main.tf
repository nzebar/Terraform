provider "azurerm"{
    features {}
}

resource "azurerm_resource_group" "RecGroupTestlab" {
    name = var.rgname
    location = var.rglocation
    }   
}