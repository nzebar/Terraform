resource "azurerm_resource_group" "RecGroupTestlab" {
    name = var.rgname
    location = var.rglocation

    tags = {
        key1 = "value1"
        key2 = "value2"
    }
    }   
