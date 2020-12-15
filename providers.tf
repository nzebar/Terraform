terraform {
  required_providers {
    azure = {
      source  = "hashicorp/azurerm"
      version = ">= 1.0"
    }
  }
}

provider "azure" {
    features {}
}

