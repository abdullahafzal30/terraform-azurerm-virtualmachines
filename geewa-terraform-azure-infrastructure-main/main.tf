provider "azurerm" {
  version = "~> 2.49.0" #"~> 2.2.0"
  features {}
}

provider "azurerm" { 
  alias   = "hub"
  version = "~> 2.49.0" #"~> 2.2.0"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-game-dev-tf-geewa-001"
    storage_account_name = "stgamedevtfstategeewa001"
    container_name       = "ctgamedevtfstategeewa002"
    subscription_id      = "db30eede-d955-4ce7-8460-ca638e6db08e"
    key                  = "y8wckwQf1y9yUfOIiwVM4MdWTR8hfjId+lFMyfSx2VixvFqEkpnL9RU+tEFdg0SiIWz2JWUmLXJY+AStCPSrbg=="
  }
}
locals {
  env = {
    default = {
    }
    geewa-dev = { 
      
      #Location_A
      location_a                       = "West Europe"
      rg_geewa_name_a                  = "rg-dev-geewa-a"
      geewa_vnet_name_a                = "vnet-game-dev-geewa-001"
      geewa_vnet_address_prefix_a      = "10.10.0.0/16"
      geewa_subnet_name_a              = "subnet-game-dev-geewa-001"
      geewa_subnet_address_prefix_a    = "10.10.1.0/24"
      
      #Location_B
      location_b                       = "France Central"
      rg_geewa_name_b                  = "rg-dev-geewa-b"
      geewa_vnet_name_b                = "vnet-game-dev-geewa-002"
      geewa_vnet_address_prefix_b      = "10.11.0.0/16"
      geewa_subnet_name_b              = "subnet-game-dev-geewa-002"
      geewa_subnet_address_prefix_b    = "10.11.1.0/24"


      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.10.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip"
      bastion_host_name               = "bastion-dev-geewa-001"

      peering_geewa_vnet_a_to_geewa_vnet_b_name = "peering-geewa-vnet-a-to-geewa-vnet-b"
      peering_geewa_vnet_b_to_geewa_vnet_a_name = "peering-geewa-vnet-b-to-geewa-vnet-a"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-dev-geewa-a"
      nic_private_ip_db     = "10.10.1.10"

      vm_geewa_dbserver     = "vm-db-geewa"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-dev-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-dev-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_A
      vm_geewa_appserver_a = "vm-app-geewa-a"
      vmsize_geewa_appserver_a = "Standard_B2ms"
      vmosdiskname_geewa_appserver_a = "osdisk-app-dev-geewa-a"
      vmosdisksize_geewa_appserver_a = "128"
      vmosdisktype_geewa_appserver_a = "Standard_LRS"
      imagepublisher_a = "MicrosoftWindowsServer"
      imageoffer_a = "WindowsServer"
      imagesku_a = "2019-Datacenter"
      pip_geewa_appserver_a_name = "pip-game-app-dev-geewa-a"
      nic_geewa_appserver_a = "nic-game-app-dev-geewa-a"
      nic_private_ip_a = "10.10.1.11"
      
      #Application_Server_B
      nic_geewa_appserver_b = "nic-game-app-dev-geewa-b"
      nic_private_ip_b = "10.11.1.11"
      pip_geewa_appserver_b_name = "pip-game-app-dev-geewa-b"
      vm_geewa_appserver_b = "vm-app-geewa-b"
      vmsize_geewa_appserver_b = "Standard_B2ms"
      vmosdiskname_geewa_appserver_b = "osdisk-app-dev-geewa-b"
      vmosdisksize_geewa_appserver_b = "128"
      vmosdisktype_geewa_appserver_b = "Standard_LRS"
      imagepublisher_b = "MicrosoftWindowsServer"
      imageoffer_b = "WindowsServer"
      imagesku_b = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-dev-geewa"
      nsg_geewa_appserver_a = "nsg-game-app-dev-geewa-a"
      nsg_geewa_appserver_b = "nsg-game-app-dev-geewa-b"

      ////////////////////////////////////////////// C AND D ////////////////////////////////////////////////////

      #Location_C
      location_c                       = "West Europe"
      rg_geewa_name_c                  = "rg-dev-geewa-c"
      geewa_vnet_name_c                = "vnet-game-dev-geewa-003"
      geewa_vnet_address_prefix_c      = "10.12.0.0/16"
      geewa_subnet_name_c              = "subnet-game-dev-geewa-003"
      geewa_subnet_address_prefix_c    = "10.12.1.0/24"
      
      #Location_D
      location_d                       = "France Central"
      rg_geewa_name_d                  = "rg-dev-geewa-d"
      geewa_vnet_name_d                = "vnet-game-dev-geewa-004"
      geewa_vnet_address_prefix_d      = "10.13.0.0/16"
      geewa_subnet_name_d              = "subnet-game-dev-geewa-004"
      geewa_subnet_address_prefix_d    = "10.13.1.0/24"


      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.12.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip"
      bastion_host_name               = "bastion-dev-geewa-001"

      peering_geewa_vnet_c_to_geewa_vnet_d_name = "peering-geewa-vnet-c-to-geewa-vnet-d"
      peering_geewa_vnet_d_to_geewa_vnet_c_name = "peering-geewa-vnet-d-to-geewa-vnet-c"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-dev-geewa-c"
      nic_private_ip_db     = "10.12.1.12"

      vm_geewa_dbserver     = "vm-db-geewa-c"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-dev-geewa-c"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-dev-geewa-c"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_C
      vm_geewa_appserver_c = "vm-app-geewa-c"
      vmsize_geewa_appserver_c = "Standard_B2ms"
      vmosdiskname_geewa_appserver_c = "osdisk-app-dev-geewa-c"
      vmosdisksize_geewa_appserver_c = "128"
      vmosdisktype_geewa_appserver_c = "Standard_LRS"
      imagepublisher_c = "MicrosoftWindowsServer"
      imageoffer_c = "WindowsServer"
      imagesku_c = "2019-Datacenter"
      pip_geewa_appserver_c_name = "pip-game-app-dev-geewa-c"
      nic_geewa_appserver_c = "nic-game-app-dev-geewa-c"
      nic_private_ip_c = "10.12.1.12"
      
      #Application_Server_D
      nic_geewa_appserver_d = "nic-game-app-dev-geewa-d"
      nic_private_ip_d = "10.13.1.13"
      pip_geewa_appserver_d_name = "pip-game-app-dev-geewa-d"
      vm_geewa_appserver_d = "vm-app-geewa-d"
      vmsize_geewa_appserver_d = "Standard_B2ms"
      vmosdiskname_geewa_appserver_d = "osdisk-app-dev-geewa-d"
      vmosdisksize_geewa_appserver_d = "128"
      vmosdisktype_geewa_appserver_d = "Standard_LRS"
      imagepublisher_d = "MicrosoftWindowsServer"
      imageoffer_d = "WindowsServer"
      imagesku_d = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-dev-geewa-c"
      nsg_geewa_appserver_c = "nsg-game-app-dev-geewa-c"
      nsg_geewa_appserver_d = "nsg-game-app-dev-geewa-d"
      
      //////////////////////////////////////////////// E AND F ////////////////////////////////////////////////////

      #Location_E
      location_e                       = "West Europe"
      rg_geewa_name_e                  = "rg-dev-geewa-e"
      geewa_vnet_name_e                = "vnet-game-dev-geewa-005"
      geewa_vnet_address_prefix_e      = "10.14.0.0/16"
      geewa_subnet_name_e              = "subnet-game-dev-geewa-005"
      geewa_subnet_address_prefix_e    = "10.14.1.0/24"
      
      #Location_F
      location_f                       = "France Central"
      rg_geewa_name_f                  = "rg-dev-geewa-f"
      geewa_vnet_name_f                = "vnet-game-dev-geewa-006"
      geewa_vnet_address_prefix_f      = "10.15.0.0/16"
      geewa_subnet_name_f              = "subnet-game-dev-geewa-006"
      geewa_subnet_address_prefix_f    = "10.15.1.0/24"


      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.14.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip"
      bastion_host_name               = "bastion-dev-geewa-006"

      peering_geewa_vnet_e_to_geewa_vnet_f_name = "peering-geewa-vnet-e-to-geewa-vnet-f"
      peering_geewa_vnet_f_to_geewa_vnet_e_name = "peering-geewa-vnet-f-to-geewa-vnet-e"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-dev-geewa-e"
      nic_private_ip_db     = "10.14.1.14"

      vm_geewa_dbserver     = "vm-db-geewa"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-dev-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-dev-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_E
      vm_geewa_appserver_e = "vm-app-geewa-e"
      vmsize_geewa_appserver_e = "Standard_B2ms"
      vmosdiskname_geewa_appserver_e = "osdisk-app-dev-geewa-e"
      vmosdisksize_geewa_appserver_e = "128"
      vmosdisktype_geewa_appserver_e = "Standard_LRS"
      imagepublisher_e = "MicrosoftWindowsServer"
      imageoffer_e = "WindowsServer"
      imagesku_e = "2019-Datacenter"
      pip_geewa_appserver_e_name = "pip-game-app-dev-geewa-e"
      nic_geewa_appserver_e = "nic-game-app-dev-geewa-e"
      nic_private_ip_e = "10.14.1.15"
      
      #Application_Server_F
      nic_geewa_appserver_f = "nic-game-app-dev-geewa-f"
      nic_private_ip_f = "10.15.1.15"
      pip_geewa_appserver_f_name = "pip-game-app-dev-geewa-f"
      vm_geewa_appserver_f = "vm-app-geewa-f"
      vmsize_geewa_appserver_f = "Standard_B2ms"
      vmosdiskname_geewa_appserver_f = "osdisk-app-dev-geewa-f"
      vmosdisksize_geewa_appserver_f = "128"
      vmosdisktype_geewa_appserver_f = "Standard_LRS"
      imagepublisher_f = "MicrosoftWindowsServer"
      imageoffer_f = "WindowsServer"
      imagesku_f = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-dev-geewa"
      nsg_geewa_appserver_e = "nsg-game-app-dev-geewa-e"
      nsg_geewa_appserver_f = "nsg-game-app-dev-geewa-f"

      /////////////////////////////////////////////// G AND H /////////////////////////////////////////////////////

      #Location_G
      location_g                       = "West Europe"
      rg_geewa_name_g                  = "rg-dev-geewa-g"
      geewa_vnet_name_g                = "vnet-game-dev-geewa-007"
      geewa_vnet_address_prefix_g      = "10.16.0.0/16"
      geewa_subnet_name_g              = "subnet-game-dev-geewa-007"
      geewa_subnet_address_prefix_g    = "10.16.1.0/24"
      
      #Location_H
      location_h                       = "France Central"
      rg_geewa_name_h                  = "rg-dev-geewa-h"
      geewa_vnet_name_h                = "vnet-game-dev-geewa-008"
      geewa_vnet_address_prefix_h      = "10.17.0.0/16"
      geewa_subnet_name_h              = "subnet-game-dev-geewa-008"
      geewa_subnet_address_prefix_h    = "10.17.1.0/24"


      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.16.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip"
      bastion_host_name               = "bastion-dev-geewa-006"

      peering_geewa_vnet_g_to_geewa_vnet_h_name = "peering-geewa-vnet-g-to-geewa-vnet-h"
      peering_geewa_vnet_h_to_geewa_vnet_g_name = "peering-geewa-vnet-h-to-geewa-vnet-g"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-dev-geewa-g"
      nic_private_ip_db     = "10.16.1.16"

      vm_geewa_dbserver     = "vm-db-geewa-g"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-dev-geewa-g"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-dev-geewa-g"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_G
      vm_geewa_appserver_g = "vm-app-geewa-g"
      vmsize_geewa_appserver_g = "Standard_B2ms"
      vmosdiskname_geewa_appserver_g = "osdisk-app-dev-geewa-g"
      vmosdisksize_geewa_appserver_g = "128"
      vmosdisktype_geewa_appserver_g = "Standard_LRS"
      imagepublisher_g = "MicrosoftWindowsServer"
      imageoffer_g = "WindowsServer"
      imagesku_g = "2019-Datacenter"
      pip_geewa_appserver_g_name = "pip-game-app-dev-geewa-g"
      nic_geewa_appserver_g = "nic-game-app-dev-geewa-g"
      nic_private_ip_g = "10.16.1.16"
      
      #Application_Server_h
      nic_geewa_appserver_h = "nic-game-app-dev-geewa-h"
      nic_private_ip_h = "10.17.1.17"
      pip_geewa_appserver_h_name = "pip-game-app-dev-geewa-h"
      vm_geewa_appserver_h = "vm-app-geewa-h"
      vmsize_geewa_appserver_h = "Standard_B2ms"
      vmosdiskname_geewa_appserver_h = "osdisk-app-dev-geewa-h"
      vmosdisksize_geewa_appserver_h = "128"
      vmosdisktype_geewa_appserver_h = "Standard_LRS"
      imagepublisher_h = "MicrosoftWindowsServer"
      imageoffer_h = "WindowsServer"
      imagesku_h = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-dev-geewa-g"
      nsg_geewa_appserver_g = "nsg-game-app-dev-geewa-g"
      nsg_geewa_appserver_h = "nsg-game-app-dev-geewa-h"
    }
    geewa-qa = {
      #Location_A
      location_a                       = "West Europe"
      rg_geewa_name_a                  = "rg-a-qa"
      geewa_vnet_name_a                = "vnet-game-qa-geewa-003"
      geewa_vnet_address_prefix_a      = "10.10.0.0/16"
      geewa_subnet_name_a              = "subnet-game-qa-geewa-003"
      geewa_subnet_address_prefix_a    = "10.10.1.0/24"
      
      #Location_B
      location_b                       = "France Central"
      rg_geewa_name_b                  = "rg-b-qa"
      geewa_vnet_name_b                = "vnet-game-qa-geewa-004"
      geewa_vnet_address_prefix_b      = "10.11.0.0/16"
      geewa_subnet_name_b              = "subnet-game-qa-geewa-004"
      geewa_subnet_address_prefix_b    = "10.11.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.10.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-qa"
      bastion_host_name               = "bastion-qa-geewa-001"

      peering_geewa_vnet_a_to_geewa_vnet_b_name = "peering-geewa-vnet-a-to-geewa-vnet-b"
      peering_geewa_vnet_b_to_geewa_vnet_a_name = "peering-geewa-vnet-b-to-geewa-vnet-a"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-qa-geewa-a"
      nic_private_ip_db     = "10.10.1.10"

      vm_geewa_dbserver     = "vm-db-geewa-qa"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-qa-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-qa-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_A
      vm_geewa_appserver_a = "vm-app-geewa-a-qa"
      vmsize_geewa_appserver_a = "Standard_B2ms"
      vmosdiskname_geewa_appserver_a = "osdisk-app-qa-geewa-a"
      vmosdisksize_geewa_appserver_a = "128"
      vmosdisktype_geewa_appserver_a = "Standard_LRS"
      imagepublisher_a = "MicrosoftWindowsServer"
      imageoffer_a = "WindowsServer"
      imagesku_a = "2019-Datacenter"
      nic_geewa_appserver_a = "nic-game-app-qa-geewa-a"
      nic_private_ip_a = "10.10.1.11"
      
      #Application_Server_B
      nic_geewa_appserver_b = "nic-game-app-qa-geewa-b"
      nic_private_ip_b = "10.11.1.11"
      vm_geewa_appserver_b = "vm-app-geewa-b-qa"
      vmsize_geewa_appserver_b = "Standard_B2ms"
      vmosdiskname_geewa_appserver_b = "osdisk-app-qa-geewa-b"
      vmosdisksize_geewa_appserver_b = "128"
      vmosdisktype_geewa_appserver_b = "Standard_LRS"
      imagepublisher_b = "MicrosoftWindowsServer"
      imageoffer_b = "WindowsServer"
      imagesku_b = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-qa-geewa"
      nsg_geewa_appserver_a = "nsg-game-app-qa-geewa-a"
      nsg_geewa_appserver_b = "nsg-game-app-qa-geewa-b"
      /////////////////////////////////////////////// C AND D ///////////////////////////////////////////
      #Location_C
      location_c                       = "West Europe"
      rg_geewa_name_c                  = "rg-dev-geewa-c"
      geewa_vnet_name_c                = "vnet-game-dev-geewa-003"
      geewa_vnet_address_prefix_c      = "10.12.0.0/16"
      geewa_subnet_name_c              = "subnet-game-dev-geewa-003"
      geewa_subnet_address_prefix_c    = "10.12.1.0/24"
      
      #Location_D
      location_d                       = "France Central"
      rg_geewa_name_d                  = "rg-dev-geewa-d"
      geewa_vnet_name_d                = "vnet-game-dev-geewa-004"
      geewa_vnet_address_prefix_d      = "10.13.0.0/16"
      geewa_subnet_name_d              = "subnet-game-dev-geewa-004"
      geewa_subnet_address_prefix_d    = "10.13.1.0/24"


      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.12.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip"
      bastion_host_name               = "bastion-dev-geewa-001"

      peering_geewa_vnet_c_to_geewa_vnet_d_name = "peering-geewa-vnet-c-to-geewa-vnet-d"
      peering_geewa_vnet_d_to_geewa_vnet_c_name = "peering-geewa-vnet-d-to-geewa-vnet-c"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-dev-geewa-c"
      nic_private_ip_db     = "10.12.1.12"

      vm_geewa_dbserver     = "vm-db-geewa-c"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-dev-geewa-c"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-dev-geewa-c"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_C
      vm_geewa_appserver_c = "vm-app-geewa-c"
      vmsize_geewa_appserver_c = "Standard_B2ms"
      vmosdiskname_geewa_appserver_c = "osdisk-app-dev-geewa-c"
      vmosdisksize_geewa_appserver_c = "128"
      vmosdisktype_geewa_appserver_c = "Standard_LRS"
      imagepublisher_c = "MicrosoftWindowsServer"
      imageoffer_c = "WindowsServer"
      imagesku_c = "2019-Datacenter"
      pip_geewa_appserver_c_name = "pip-game-app-dev-geewa-c"
      nic_geewa_appserver_c = "nic-game-app-dev-geewa-c"
      nic_private_ip_c = "10.12.1.12"
      
      #Application_Server_D
      nic_geewa_appserver_d = "nic-game-app-dev-geewa-d"
      nic_private_ip_d = "10.13.1.13"
      pip_geewa_appserver_d_name = "pip-game-app-dev-geewa-d"
      vm_geewa_appserver_d = "vm-app-geewa-d"
      vmsize_geewa_appserver_d = "Standard_B2ms"
      vmosdiskname_geewa_appserver_d = "osdisk-app-dev-geewa-d"
      vmosdisksize_geewa_appserver_d = "128"
      vmosdisktype_geewa_appserver_d = "Standard_LRS"
      imagepublisher_d = "MicrosoftWindowsServer"
      imageoffer_d = "WindowsServer"
      imagesku_d = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-dev-geewa-c"
      nsg_geewa_appserver_c = "nsg-game-app-dev-geewa-c"
      nsg_geewa_appserver_d = "nsg-game-app-dev-geewa-d"
      
      /////////////////////////////////////////////// E AND F ///////////////////////////////////////////

      #Location_E
      location_e                       = "West Europe"
      rg_geewa_name_e                  = "rg-e-qa"
      geewa_vnet_name_e                = "vnet-game-qa-geewa-005"
      geewa_vnet_address_prefix_e      = "10.14.0.0/16"
      geewa_subnet_name_e              = "subnet-game-qa-geewa-005"
      geewa_subnet_address_prefix_e    = "10.14.1.0/24"
      
      #Location_F
      location_f                       = "France Central"
      rg_geewa_name_f                  = "rg-f-qa"
      geewa_vnet_name_f                = "vnet-game-qa-geewa-006"
      geewa_vnet_address_prefix_f      = "10.15.0.0/16"
      geewa_subnet_name_f              = "subnet-game-qa-geewa-006"
      geewa_subnet_address_prefix_f    = "10.15.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.14.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-qa"
      bastion_host_name               = "bastion-qa-geewa-006"

      peering_geewa_vnet_e_to_geewa_vnet_f_name = "peering-geewa-vnet-e-to-geewa-vnet-f"
      peering_geewa_vnet_f_to_geewa_vnet_e_name = "peering-geewa-vnet-f-to-geewa-vnet-e"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-qa-geewa-e"
      nic_private_ip_db     = "10.14.1.14"

      vm_geewa_dbserver     = "vm-db-geewa-qa"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-qa-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-qa-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_E
      vm_geewa_appserver_e = "vm-app-geewa-e-qa"
      vmsize_geewa_appserver_e = "Standard_B2ms"
      vmosdiskname_geewa_appserver_e = "osdisk-app-qa-geewa-e"
      vmosdisksize_geewa_appserver_e = "128"
      vmosdisktype_geewa_appserver_e = "Standard_LRS"
      imagepublisher_e = "MicrosoftWindowsServer"
      imageoffer_e = "WindowsServer"
      imagesku_e = "2019-Datacenter"
      nic_geewa_appserver_e = "nic-game-app-qa-geewa-e"
      nic_private_ip_e = "10.14.1.15"
      
      #Application_Server_F
      nic_geewa_appserver_f = "nic-game-app-qa-geewa-f"
      nic_private_ip_f = "10.15.1.15"
      vm_geewa_appserver_f = "vm-app-geewa-f-qa"
      vmsize_geewa_appserver_f = "Standard_B2ms"
      vmosdiskname_geewa_appserver_f = "osdisk-app-qa-geewa-f"
      vmosdisksize_geewa_appserver_f = "128"
      vmosdisktype_geewa_appserver_f = "Standard_LRS"
      imagepublisher_f = "MicrosoftWindowsServer"
      imageoffer_f = "WindowsServer"
      imagesku_f = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-qa-geewa"
      nsg_geewa_appserver_e = "nsg-game-app-qa-geewa-e"
      nsg_geewa_appserver_f = "nsg-game-app-qa-geewa-f"
      
      /////////////////////////////////////////////// G AND H ///////////////////////////////////////////

      #Location_G
      location_g                       = "West Europe"
      rg_geewa_name_g                  = "rg-g-qa"
      geewa_vnet_name_g                = "vnet-game-qa-geewa-007"
      geewa_vnet_address_prefix_g      = "10.16.0.0/16"
      geewa_subnet_name_g              = "subnet-game-qa-geewa-007"
      geewa_subnet_address_prefix_g    = "10.16.1.0/24"
      
      #Location_H
      location_h                       = "France Central"
      rg_geewa_name_h                  = "rg-h-qa"
      geewa_vnet_name_h                = "vnet-game-qa-geewa-008"
      geewa_vnet_address_prefix_h      = "10.17.0.0/16"
      geewa_subnet_name_h              = "subnet-game-qa-geewa-008"
      geewa_subnet_address_prefix_h    = "10.17.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.16.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-qa"
      bastion_host_name               = "bastion-qa-geewa-006"

      peering_geewa_vnet_g_to_geewa_vnet_h_name = "peering-geewa-vnet-g-to-geewa-vnet-h"
      peering_geewa_vnet_h_to_geewa_vnet_g_name = "peering-geewa-vnet-h-to-geewa-vnet-g"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-qa-geewa-g"
      nic_private_ip_db     = "10.16.1.16"

      vm_geewa_dbserver     = "vm-db-geewa-qa-g"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-qa-geewa-g"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-qa-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_G
      vm_geewa_appserver_g = "vm-app-geewa-g-qa"
      vmsize_geewa_appserver_g = "Standard_B2ms"
      vmosdiskname_geewa_appserver_g = "osdisk-app-qa-geewa-g"
      vmosdisksize_geewa_appserver_g = "128"
      vmosdisktype_geewa_appserver_g = "Standard_LRS"
      imagepublisher_g = "MicrosoftWindowsServer"
      imageoffer_g = "WindowsServer"
      imagesku_g = "2019-Datacenter"
      nic_geewa_appserver_g = "nic-game-app-qa-geewa-g"
      nic_private_ip_g = "10.16.1.16"
      
      #Application_Server_H
      nic_geewa_appserver_h = "nic-game-app-qa-geewa-h"
      nic_private_ip_h = "10.17.1.17"
      vm_geewa_appserver_h = "vm-app-geewa-h-qa"
      vmsize_geewa_appserver_h = "Standard_B2ms"
      vmosdiskname_geewa_appserver_h = "osdisk-app-qa-geewa-h"
      vmosdisksize_geewa_appserver_h = "128"
      vmosdisktype_geewa_appserver_h = "Standard_LRS"
      imagepublisher_h = "MicrosoftWindowsServer"
      imageoffer_h = "WindowsServer"
      imagesku_h = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-qa-geewa-h"
      nsg_geewa_appserver_g = "nsg-game-app-qa-geewa-g"
      nsg_geewa_appserver_h = "nsg-game-app-qa-geewa-h"
    }
    geewa-uat = {
      #Location_A
      location_a                       = "West Europe"
      rg_geewa_name_a                  = "rg-a-uat"
      geewa_vnet_name_a                = "vnet-game-uat-geewa-003"
      geewa_vnet_address_prefix_a      = "10.10.0.0/16"
      geewa_subnet_name_a              = "subnet-game-uat-geewa-003"
      geewa_subnet_address_prefix_a    = "10.10.1.0/24"
      
      #Location_B
      location_b                       = "France Central"
      rg_geewa_name_b                  = "rg-b"
      geewa_vnet_name_b                = "vnet-game-uat-geewa-004"
      geewa_vnet_address_prefix_b      = "10.11.0.0/16"
      geewa_subnet_name_b              = "subnet-game-uat-geewa-004"
      geewa_subnet_address_prefix_b    = "10.11.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.11.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-uat"
      bastion_host_name               = "bastion-uat-geewa-001"

      peering_geewa_vnet_a_to_geewa_vnet_b_name = "peering-geewa-vnet-a-to-geewa-vnet-b"
      peering_geewa_vnet_b_to_geewa_vnet_a_name = "peering-geewa-vnet-b-to-geewa-vnet-a"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-uat-geewa-a"
      nic_private_ip_db     = "10.10.1.10"

      vm_geewa_dbserver     = "vm-db-geewa-uat"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-uat-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-uat-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_A
      vm_geewa_appserver_a = "vm-app-geewa-a-uat"
      vmsize_geewa_appserver_a = "Standard_B2ms"
      vmosdiskname_geewa_appserver_a = "osdisk-app-uat-geewa-a"
      vmosdisksize_geewa_appserver_a = "128"
      vmosdisktype_geewa_appserver_a = "Standard_LRS"
      imagepublisher_a = "MicrosoftWindowsServer"
      imageoffer_a = "WindowsServer"
      imagesku_a = "2019-Datacenter"
      nic_geewa_appserver_a = "nic-game-app-uat-geewa-a"
      nic_private_ip_a = "10.10.1.11"
      
      #Application_Server_B
      nic_geewa_appserver_b = "nic-game-app-uat-geewa-b"
      nic_private_ip_b = "10.11.1.11"
      vm_geewa_appserver_b = "vm-app-geewa-b-uat"
      vmsize_geewa_appserver_b = "Standard_B2ms"
      vmosdiskname_geewa_appserver_b = "osdisk-app-uat-geewa-b"
      vmosdisksize_geewa_appserver_b = "128"
      vmosdisktype_geewa_appserver_b = "Standard_LRS"
      imagepublisher_b = "MicrosoftWindowsServer"
      imageoffer_b = "WindowsServer"
      imagesku_b = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-uat-geewa"
      nsg_geewa_appserver_a = "nsg-game-app-uat-geewa-a"
      nsg_geewa_appserver_b = "nsg-game-app-uat-geewa-b"

      /////////////////////////////////////////////////// C AND D /////////////////////////////////////////
      #Location_C
      location_c                       = "West Europe"
      rg_geewa_name_c                  = "rg-c-uat"
      geewa_vnet_name_c                = "vnet-game-uat-geewa-003"
      geewa_vnet_address_prefix_c      = "10.12.0.0/16"
      geewa_subnet_name_c              = "subnet-game-uat-geewa-003"
      geewa_subnet_address_prefix_c    = "10.12.1.0/24"
      
      #Location_D
      location_d                       = "France Central"
      rg_geewa_name_d                  = "rg-d"
      geewa_vnet_name_d                = "vnet-game-uat-geewa-004"
      geewa_vnet_address_prefix_d      = "10.13.0.0/16"
      geewa_subnet_name_d              = "subnet-game-uat-geewa-004"
      geewa_subnet_address_prefix_d    = "10.13.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.12.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-uat"
      bastion_host_name               = "bastion-uat-geewa-002"

      peering_geewa_vnet_c_to_geewa_vnet_d_name = "peering-geewa-vnet-c-to-geewa-vnet-d"
      peering_geewa_vnet_d_to_geewa_vnet_c_name = "peering-geewa-vnet-d-to-geewa-vnet-c"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-uat-geewa-c"
      nic_private_ip_db     = "10.12.1.12"

      vm_geewa_dbserver     = "vm-db-geewa-uat"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-uat-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-uat-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_C
      vm_geewa_appserver_c = "vm-app-geewa-c-uat"
      vmsize_geewa_appserver_c = "Standard_B2ms"
      vmosdiskname_geewa_appserver_c = "osdisk-app-uat-geewa-c"
      vmosdisksize_geewa_appserver_c = "128"
      vmosdisktype_geewa_appserver_c = "Standard_LRS"
      imagepublisher_c = "MicrosoftWindowsServer"
      imageoffer_c = "WindowsServer"
      imagesku_c = "2019-Datacenter"
      nic_geewa_appserver_c = "nic-game-app-uat-geewa-c"
      nic_private_ip_c = "10.12.1.13"
      
      #Application_Server_D
      nic_geewa_appserver_d = "nic-game-app-uat-geewa-d"
      nic_private_ip_d = "10.13.1.13"
      vm_geewa_appserver_d = "vm-app-geewa-d-uat"
      vmsize_geewa_appserver_d = "Standard_B2ms"
      vmosdiskname_geewa_appserver_d = "osdisk-app-uat-geewa-d"
      vmosdisksize_geewa_appserver_d = "128"
      vmosdisktype_geewa_appserver_d = "Standard_LRS"
      imagepublisher_d = "MicrosoftWindowsServer"
      imageoffer_d = "WindowsServer"
      imagesku_d = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-uat-geewa"
      nsg_geewa_appserver_c = "nsg-game-app-uat-geewa-c"
      nsg_geewa_appserver_d = "nsg-game-app-uat-geewa-d"
      
      ///////////////////////////////////////////////// G AND H ////////////////////////////////////////////////

      #Location_G
      location_g                       = "West Europe"
      rg_geewa_name_g                  = "rg-g-uat"
      geewa_vnet_name_g                = "vnet-game-uat-geewa-007"
      geewa_vnet_address_prefix_g      = "10.16.0.0/16"
      geewa_subnet_name_g              = "subnet-game-uat-geewa-007"
      geewa_subnet_address_prefix_g    = "10.16.1.0/24"
      
      #Location_H
      location_h                       = "France Central"
      rg_geewa_name_h                  = "rg-h"
      geewa_vnet_name_h                = "vnet-game-uat-geewa-008"
      geewa_vnet_address_prefix_h      = "10.17.0.0/16"
      geewa_subnet_name_h              = "subnet-game-uat-geewa-008"
      geewa_subnet_address_prefix_h    = "10.17.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.17.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-uat"
      bastion_host_name               = "bastion-uat-geewa-006"

      peering_geewa_vnet_g_to_geewa_vnet_h_name = "peering-geewa-vnet-g-to-geewa-vnet-h"
      peering_geewa_vnet_h_to_geewa_vnet_g_name = "peering-geewa-vnet-h-to-geewa-vnet-g"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-uat-geewa-g"
      nic_private_ip_db     = "10.16.1.16"

      vm_geewa_dbserver     = "vm-db-geewa-uat"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-uat-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-uat-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_G
      vm_geewa_appserver_g = "vm-app-geewa-g-uat"
      vmsize_geewa_appserver_g = "Standard_B2ms"
      vmosdiskname_geewa_appserver_g = "osdisk-app-uat-geewa-g"
      vmosdisksize_geewa_appserver_g = "128"
      vmosdisktype_geewa_appserver_g = "Standard_LRS"
      imagepublisher_g = "MicrosoftWindowsServer"
      imageoffer_g = "WindowsServer"
      imagesku_g = "2019-Datacenter"
      nic_geewa_appserver_g = "nic-game-app-uat-geewa-g"
      nic_private_ip_g = "10.17.1.18"
      
      #Application_Server_H
      nic_geewa_appserver_h = "nic-game-app-uat-geewa-h"
      nic_private_ip_h = "10.17.1.17"
      vm_geewa_appserver_h = "vm-app-geewa-d-uat"
      vmsize_geewa_appserver_h = "Standard_B2ms"
      vmosdiskname_geewa_appserver_h = "osdisk-app-uat-geewa-h"
      vmosdisksize_geewa_appserver_h = "128"
      vmosdisktype_geewa_appserver_h = "Standard_LRS"
      imagepublisher_h = "MicrosoftWindowsServer"
      imageoffer_h = "WindowsServer"
      imagesku_h = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-uat-geewa"
      nsg_geewa_appserver_g = "nsg-game-app-uat-geewa-g"
      nsg_geewa_appserver_h = "nsg-game-app-uat-geewa-h"
    }
    geewa-prod = {
      #Location_A
      location_a                       = "West Europe"
      rg_geewa_name_a                  = "rg-a-prod"
      geewa_vnet_name_a                = "vnet-game-prod-geewa-003"
      geewa_vnet_address_prefix_a      = "10.10.0.0/16"
      geewa_subnet_name_a              = "subnet-game-prod-geewa-003"
      geewa_subnet_address_prefix_a    = "10.10.1.0/24"
      
      #Location_B
      location_b                       = "France Central"
      rg_geewa_name_b                  = "rg-b-prod"
      geewa_vnet_name_b                = "vnet-game-prod-geewa-004"
      geewa_vnet_address_prefix_b      = "10.11.0.0/16"
      geewa_subnet_name_b              = "subnet-game-prod-geewa-004"
      geewa_subnet_address_prefix_b    = "10.11.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.10.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-prod"
      bastion_host_name               = "bastion-prod-geewa-001"

      peering_geewa_vnet_a_to_geewa_vnet_b_name = "peering-geewa-vnet-a-to-geewa-vnet-b"
      peering_geewa_vnet_b_to_geewa_vnet_a_name = "peering-geewa-vnet-b-to-geewa-vnet-a"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-prod-geewa-a"
      nic_private_ip_db     = "10.10.1.10"

      vm_geewa_dbserver     = "vm-db-geewa-prod"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-prod-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-prod-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_A
      vm_geewa_appserver_a = "vm-app-geewa-a-prod"
      vmsize_geewa_appserver_a = "Standard_B2ms"
      vmosdiskname_geewa_appserver_a = "osdisk-app-prod-geewa-a"
      vmosdisksize_geewa_appserver_a = "128"
      vmosdisktype_geewa_appserver_a = "Standard_LRS"
      imagepublisher_a = "MicrosoftWindowsServer"
      imageoffer_a = "WindowsServer"
      imagesku_a = "2019-Datacenter"
      nic_geewa_appserver_a = "nic-game-app-prod-geewa-a"
      nic_private_ip_a = "10.10.1.11"
      
      #Application_Server_B
      nic_geewa_appserver_b = "nic-game-prod-dev-geewa-b"
      nic_private_ip_b = "10.11.1.11"
      vm_geewa_appserver_b = "vm-app-geewa-b-prod"
      vmsize_geewa_appserver_b = "Standard_B2ms"
      vmosdiskname_geewa_appserver_b = "osdisk-prod-dev-geewa-b"
      vmosdisksize_geewa_appserver_b = "128"
      vmosdisktype_geewa_appserver_b = "Standard_LRS"
      imagepublisher_b = "MicrosoftWindowsServer"
      imageoffer_b = "WindowsServer"
      imagesku_b = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-dev-geewa"
      nsg_geewa_appserver_a = "nsg-game-app-prod-geewa-a"
      nsg_geewa_appserver_b = "nsg-game-app-prod-geewa-b"

      //////////////////////////////////////////////// C AND D /////////////////////////////////////////////////
      #Location_C
      location_c                       = "West Europe"
      rg_geewa_name_c                  = "rg-c-prod"
      geewa_vnet_name_c                = "vnet-game-prod-geewa-003"
      geewa_vnet_address_prefix_c      = "10.12.0.0/16"
      geewa_subnet_name_c              = "subnet-game-prod-geewa-003"
      geewa_subnet_address_prefix_c    = "10.12.1.0/24"
      
      #Location_D
      location_d                       = "France Central"
      rg_geewa_name_d                  = "rg-d-prod"
      geewa_vnet_name_d                = "vnet-game-prod-geewa-004"
      geewa_vnet_address_prefix_d      = "10.13.0.0/16"
      geewa_subnet_name_d              = "subnet-game-prod-geewa-004"
      geewa_subnet_address_prefix_d    = "10.13.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.12.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-prod"
      bastion_host_name               = "bastion-prod-geewa-002"

      peering_geewa_vnet_a_to_geewa_vnet_b_name = "peering-geewa-vnet-c-to-geewa-vnet-d"
      peering_geewa_vnet_b_to_geewa_vnet_a_name = "peering-geewa-vnet-d-to-geewa-vnet-c"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-prod-geewa-c"
      nic_private_ip_db     = "10.12.1.12"

      vm_geewa_dbserver     = "vm-db-geewa-prod"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-prod-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-prod-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_C
      vm_geewa_appserver_c = "vm-app-geewa-c-prod"
      vmsize_geewa_appserver_c = "Standard_B2ms"
      vmosdiskname_geewa_appserver_c = "osdisk-app-prod-geewa-c"
      vmosdisksize_geewa_appserver_c = "128"
      vmosdisktype_geewa_appserver_c = "Standard_LRS"
      imagepublisher_c = "MicrosoftWindowsServer"
      imageoffer_c = "WindowsServer"
      imagesku_c = "2019-Datacenter"
      nic_geewa_appserver_c = "nic-game-app-prod-geewa-a"
      nic_private_ip_c = "10.12.1.13"
      
      #Application_Server_D
      nic_geewa_appserver_d = "nic-game-prod-dev-geewa-d"
      nic_private_ip_d = "10.13.1.13"
      vm_geewa_appserver_d = "vm-app-geewa-d-prod"
      vmsize_geewa_appserver_d = "Standard_B2ms"
      vmosdiskname_geewa_appserver_d = "osdisk-prod-dev-geewa-d"
      vmosdisksize_geewa_appserver_d = "128"
      vmosdisktype_geewa_appserver_d = "Standard_LRS"
      imagepublisher_d = "MicrosoftWindowsServer"
      imageoffer_d = "WindowsServer"
      imagesku_d = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-dev-geewa"
      nsg_geewa_appserver_c = "nsg-game-app-prod-geewa-c"
      nsg_geewa_appserver_d = "nsg-game-app-prod-geewa-d"

      /////////////////////////////////////////// E AND F //////////////////////////////////////////////////////////

      #Location_E
      location_e                       = "West Europe"
      rg_geewa_name_e                  = "rg-e-prod"
      geewa_vnet_name_e                = "vnet-game-prod-geewa-005"
      geewa_vnet_address_prefix_e      = "10.14.0.0/16"
      geewa_subnet_name_e              = "subnet-game-prod-geewa-005"
      geewa_subnet_address_prefix_e    = "10.14.1.0/24"
      
      #Location_F
      location_f                       = "France Central"
      rg_geewa_name_f                  = "rg-f-prod"
      geewa_vnet_name_f                = "vnet-game-prod-geewa-006"
      geewa_vnet_address_prefix_f      = "10.15.0.0/16"
      geewa_subnet_name_f              = "subnet-game-prod-geewa-006"
      geewa_subnet_address_prefix_f    = "10.15.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.14.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-prod"
      bastion_host_name               = "bastion-prod-geewa-006"

      peering_geewa_vnet_e_to_geewa_vnet_f_name = "peering-geewa-vnet-e-to-geewa-vnet-f"
      peering_geewa_vnet_f_to_geewa_vnet_e_name = "peering-geewa-vnet-f-to-geewa-vnet-e"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-prod-geewa-e"
      nic_private_ip_db     = "10.14.1.14"

      vm_geewa_dbserver     = "vm-db-geewa-prod"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-prod-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-prod-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_E
      vm_geewa_appserver_e = "vm-app-geewa-e-prod"
      vmsize_geewa_appserver_e = "Standard_B2ms"
      vmosdiskname_geewa_appserver_e = "osdisk-app-prod-geewa-e"
      vmosdisksize_geewa_appserver_e = "128"
      vmosdisktype_geewa_appserver_e = "Standard_LRS"
      imagepublisher_e = "MicrosoftWindowsServer"
      imageoffer_e = "WindowsServer"
      imagesku_e = "2019-Datacenter"
      nic_geewa_appserver_e = "nic-game-app-prod-geewa-e"
      nic_private_ip_e = "10.14.1.15"
      
      #Application_Server_F
      nic_geewa_appserver_f = "nic-game-prod-dev-geewa-f"
      nic_private_ip_f = "10.15.1.15"
      vm_geewa_appserver_f = "vm-app-geewa-f-prod"
      vmsize_geewa_appserver_f = "Standard_B2ms"
      vmosdiskname_geewa_appserver_f = "osdisk-prod-dev-geewa-f"
      vmosdisksize_geewa_appserver_f = "128"
      vmosdisktype_geewa_appserver_f = "Standard_LRS"
      imagepublisher_f = "MicrosoftWindowsServer"
      imageoffer_f = "WindowsServer"
      imagesku_f = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-dev-geewa"
      nsg_geewa_appserver_e = "nsg-game-app-prod-geewa-e"
      nsg_geewa_appserver_f = "nsg-game-app-prod-geewa-f"

      ////////////////////////////////////////////// G AND H /////////////////////////////////////////////////////

      #Location_G
      location_g                       = "West Europe"
      rg_geewa_name_g                  = "rg-g-prod"
      geewa_vnet_name_g                = "vnet-game-prod-geewa-007"
      geewa_vnet_address_prefix_g      = "10.16.0.0/16"
      geewa_subnet_name_g              = "subnet-game-prod-geewa-007"
      geewa_subnet_address_prefix_g    = "10.16.1.0/24"
      
      #Location_H
      location_h                       = "France Central"
      rg_geewa_name_h                  = "rg-d-prod"
      geewa_vnet_name_h                = "vnet-game-prod-geewa-008"
      geewa_vnet_address_prefix_h      = "10.17.0.0/16"
      geewa_subnet_name_h              = "subnet-game-prod-geewa-008"
      geewa_subnet_address_prefix_h    = "10.17.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.16.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-prod"
      bastion_host_name               = "bastion-prod-geewa-006"

      peering_geewa_vnet_g_to_geewa_vnet_h_name = "peering-geewa-vnet-g-to-geewa-vnet-h"
      peering_geewa_vnet_h_to_geewa_vnet_g_name = "peering-geewa-vnet-h-to-geewa-vnet-g"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-prod-geewa-g"
      nic_private_ip_db     = "10.16.1.16"

      vm_geewa_dbserver     = "vm-db-geewa-prod"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-prod-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-prod-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_G
      vm_geewa_appserver_g = "vm-app-geewa-g-prod"
      vmsize_geewa_appserver_g = "Standard_B2ms"
      vmosdiskname_geewa_appserver_g = "osdisk-app-prod-geewa-g"
      vmosdisksize_geewa_appserver_g = "128"
      vmosdisktype_geewa_appserver_g = "Standard_LRS"
      imagepublisher_g = "MicrosoftWindowsServer"
      imageoffer_g = "WindowsServer"
      imagesku_g = "2019-Datacenter"
      nic_geewa_appserver_g = "nic-game-app-prod-geewa-g"
      nic_private_ip_g = "10.16.1.16"
      
      #Application_Server_H
      nic_geewa_appserver_h = "nic-game-prod-dev-geewa-h"
      nic_private_ip_h = "10.17.1.17"
      vm_geewa_appserver_h = "vm-app-geewa-h-prod"
      vmsize_geewa_appserver_h = "Standard_B2ms"
      vmosdiskname_geewa_appserver_h = "osdisk-prod-dev-geewa-h"
      vmosdisksize_geewa_appserver_h = "128"
      vmosdisktype_geewa_appserver_h = "Standard_LRS"
      imagepublisher_h = "MicrosoftWindowsServer"
      imageoffer_h = "WindowsServer"
      imagesku_h = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-dev-geewa"
      nsg_geewa_appserver_g = "nsg-game-app-prod-geewa-g"
      nsg_geewa_appserver_h = "nsg-game-app-prod-geewa-h"
    }
  }  
  environmentvars = contains(keys(local.env), terraform.workspace) ? terraform.workspace : "default"
  workspace       = merge(local.env["default"], local.env[local.environmentvars])
}
