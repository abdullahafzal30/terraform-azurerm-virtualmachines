terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg-game-dev-tf-geewa-001" {
  name     = "rg-game-dev-tf-geewa-001"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "appserviceplan"
  location            = azurerm_resource_group.rg-game-dev-tf-geewa-001.location
  resource_group_name = azurerm_resource_group.rg-game-dev-tf-geewa-001.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app-service" {
  name                = "app-service"
  location            = azurerm_resource_group.rg-game-dev-tf-geewa-001.location
  resource_group_name = azurerm_resource_group.rg-game-dev-tf-geewa-001.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}
