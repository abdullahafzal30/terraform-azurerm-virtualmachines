resource "azurerm_public_ip" "pip_geewa_appserver_a_name" {
  name                = var.pip_geewa_appserver_a_name
  location            = var.location_a
  resource_group_name = var.rg_geewa_name_a
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_network_interface" "nic_geewa_appserver_a" {
  name                = var.nic_geewa_appserver_a
  location            = var.location_a
  resource_group_name = var.rg_geewa_name_a

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_a_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_a
    public_ip_address_id = azurerm_public_ip.pip_geewa_appserver_a_name.id
  }
}
resource "azurerm_virtual_machine" "vm_geewa_appserver_a" {
  name                = var.vm_geewa_appserver_a
  resource_group_name = var.rg_geewa_name_a
  location            = var.location_a
  vm_size                = var.vmsize_geewa_appserver_a
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_a]
  network_interface_ids = [
    azurerm_network_interface.nic_geewa_appserver_a.id,
  ]

 storage_os_disk {
    name              = var.vmosdiskname_geewa_appserver_a
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_appserver_a
    disk_size_gb      = var.vmosdisksize_geewa_appserver_a
  }

  storage_image_reference {
    publisher = var.imagepublisher_a
    offer     = var.imageoffer_a
    sku       = var.imagesku_a
    version   = "latest"
  }
    os_profile {
    computer_name  = var.vm_geewa_appserver_a
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
    os_profile_windows_config {
    provision_vm_agent = true
  }
}
resource "azurerm_public_ip" "pip_geewa_appserver_b_name" {
  name                = var.pip_geewa_appserver_b_name
  location            = var.location_b
  resource_group_name = var.rg_geewa_name_b
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_network_interface" "nic_geewa_appserver_b" {
  name                = var.nic_geewa_appserver_b
  location            = var.location_b
  resource_group_name = var.rg_geewa_name_b

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_b_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_b
    public_ip_address_id = azurerm_public_ip.pip_geewa_appserver_b_name.id
  }
}
resource "azurerm_virtual_machine" "vm_geewa_appserver_b" {
  name                = var.vm_geewa_appserver_b
  resource_group_name = var.rg_geewa_name_b
  location            = var.location_b
  vm_size                = var.vmsize_geewa_appserver_b
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_b]
  network_interface_ids = [
    azurerm_network_interface.nic_geewa_appserver_b.id,
  ]

 storage_os_disk {
    name              = var.vmosdiskname_geewa_appserver_b
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_appserver_b
    disk_size_gb      = var.vmosdisksize_geewa_appserver_b
  }

  storage_image_reference {
    publisher = var.imagepublisher_b
    offer     = var.imageoffer_b
    sku       = var.imagesku_b
    version   = "latest"
  }
    os_profile {
    computer_name  = var.vm_geewa_appserver_b
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
    os_profile_windows_config {
    provision_vm_agent = true
  }
}
resource "azurerm_network_interface" "nic_geewa_dbserver" {
  name                = var.nic_geewa_dbserver
  location            = var.location_a
  resource_group_name = var.rg_geewa_name_a

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_a_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_db
  }
}
resource "azurerm_virtual_machine" "vm_geewa_dbserver" {
  name                  = var.vm_geewa_dbserver
  location              = var.location_a
  resource_group_name   = var.rg_geewa_name_a
  network_interface_ids = [azurerm_network_interface.nic_geewa_dbserver.id]
  vm_size               = var.vmsize_geewa_dbserver
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver]

  storage_image_reference {
    publisher = var.imagepublisher_db
    offer     = var.imageoffer_db
    sku       = var.imagesku_db
    version   = "latest"
  }

  storage_os_disk {
    name              = var.vmosdiskname_geewa_dbserver
    caching           = "ReadOnly"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_dbserver
    disk_size_gb      = var.vmosdisksize_geewa_dbserver
  }

  os_profile {
    computer_name  = var.vm_geewa_dbserver
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    timezone                  = "Pacific Standard Time"
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }
}
# add a data disk - we were going to iterate through a collection
resource "azurerm_managed_disk" "datadisk_geewa_dbserver" {
    name                    = var.datadisk_geewa_dbserver 
    location                = var.location_a
    resource_group_name     = var.rg_geewa_name_a
    storage_account_type    = var.datadisk_type_dbserver
    create_option           = "Empty"
    disk_size_gb            = var.datadisksize_geewa_dbserver
}
resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_attach" {
    managed_disk_id    = azurerm_managed_disk.datadisk_geewa_dbserver.id
    virtual_machine_id = azurerm_virtual_machine.vm_geewa_dbserver.id
    lun                = 1
    caching            = "ReadWrite"
    depends_on            = [azurerm_managed_disk.datadisk_geewa_dbserver, azurerm_virtual_machine.vm_geewa_dbserver ]
}
resource "azurerm_mssql_virtual_machine" "sqlvm_geewa_dbserver" {
  virtual_machine_id = azurerm_virtual_machine.vm_geewa_dbserver.id
  sql_license_type   = var.sql_license_type
  r_services_enabled               = true
  sql_connectivity_port            = var.sql_connectivity_port
  sql_connectivity_type            = var.sql_connectivity_type
  sql_connectivity_update_password = var.sql_connectivity_update_password
  sql_connectivity_update_username = var.sql_connectivity_update_username
  depends_on            = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach, azurerm_virtual_machine.vm_geewa_dbserver]

  auto_patching {
    day_of_week                            = "Sunday"
    maintenance_window_duration_in_minutes = 60
    maintenance_window_starting_hour       = 2
  }
  #The storage_configuration block supports the following:
    storage_configuration {
        disk_type               = "NEW"                         # (Required) The type of disk configuration to apply to the SQL Server. Valid values include NEW, EXTEND, or ADD.
        storage_workload_type   = "OLTP"                        # (Required) The type of storage workload. Valid values include GENERAL, OLTP, or DW.
        # The storage_settings block supports the following:
        data_settings {
            default_file_path = var.sql_datafilepath     # (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun]
        }
        log_settings {
            default_file_path = var.sql_logfilepath     # (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun]                                 # (Required) A list of Logical Unit Numbers for the disks.
        }
        temp_db_settings {
            default_file_path = var.sql_tempdbfilepath   #- (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun] 
        }
    }
}
resource "azurerm_network_security_group" "nsg_geewa_appserver_a" {
  name                = var.nsg_geewa_appserver_a
  location            = var.location_a
  resource_group_name = var.rg_geewa_name_a
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_a]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389"]
    source_address_prefixes      = ["10.10.1.0/24","10.11.1.0/24","10.10.2.0/24"]
    destination_address_prefix = "*"
  } 
  security_rule {
    name                       = "PortAllowonWAN"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["443","80","9339"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  } 
  
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_appserver_a" {
  network_interface_id      = azurerm_network_interface.nic_geewa_appserver_a.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_appserver_a.id
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_a, azurerm_network_security_group.nsg_geewa_appserver_a]
}
resource "azurerm_network_security_group" "nsg_geewa_appserver_b" {
  name                = var.nsg_geewa_appserver_b
  location            = var.location_b
  resource_group_name = var.rg_geewa_name_b
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_b]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389"]
    source_address_prefixes      = ["10.10.1.0/24","10.11.1.0/24","10.10.2.0/24"]
    destination_address_prefix = "*"
  } 
  security_rule {
    name                       = "PortAllowonWAN"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["443","80","9339"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  } 
  
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_appserver_b" {
  network_interface_id      = azurerm_network_interface.nic_geewa_appserver_b.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_appserver_b.id
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_b, azurerm_network_security_group.nsg_geewa_appserver_b]
}
resource "azurerm_network_security_group" "nsg_geewa_db" {
  name                = var.nsg_geewa_db
  location            = var.location_a
  resource_group_name = var.rg_geewa_name_a
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389","1433"]
    source_address_prefixes      = ["10.10.1.0/24","10.11.1.0/24","10.10.2.0/24"]
    destination_address_prefix = "*"
  }   
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_db" {
  network_interface_id      = azurerm_network_interface.nic_geewa_dbserver.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_db.id
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver, azurerm_network_security_group.nsg_geewa_db]
}
resource "azurerm_virtual_machine_extension" "Install_dotNet_IIS-a" {
  name                 = "install-dotNet-IIS-a"
  virtual_machine_id   = azurerm_virtual_machine.vm_geewa_appserver_a.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  depends_on            = [azurerm_virtual_machine.vm_geewa_appserver_a]

  protected_settings = <<SETTINGS
  {
   "commandToExecute": "powershell -encodedCommand ${textencodebase64(file(".\\virtualmachines\\InstallIIS.ps1"), "UTF-16LE")}"
  }
  SETTINGS
}
resource "azurerm_virtual_machine_extension" "Install_dotNet_IIS-b" {
  name                 = "Install_dotNet_IIS-b"
  virtual_machine_id   = azurerm_virtual_machine.vm_geewa_appserver_b.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  depends_on            = [azurerm_virtual_machine.vm_geewa_appserver_b]

  protected_settings = <<SETTINGS
  {
   "commandToExecute": "powershell -encodedCommand ${textencodebase64(file(".\\virtualmachines\\InstallIIS.ps1"), "UTF-16LE")}"
  }
  SETTINGS
}

///////////////////////////////////////////////// C AND D //////////////////////////////////////////////////////

resource "azurerm_public_ip" "pip_geewa_appserver_c_name" {
  name                = var.pip_geewa_appserver_c_name
  location            = var.location_c
  resource_group_name = var.rg_geewa_name_c
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_network_interface" "nic_geewa_appserver_c" {
  name                = var.nic_geewa_appserver_c
  location            = var.location_c
  resource_group_name = var.rg_geewa_name_c

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_c_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_c
    public_ip_address_id = azurerm_public_ip.pip_geewa_appserver_c_name.id
  }
}
resource "azurerm_virtual_machine" "vm_geewa_appserver_c" {
  name                = var.vm_geewa_appserver_c
  resource_group_name = var.rg_geewa_name_c
  location            = var.location_c
  vm_size                = var.vmsize_geewa_appserver_c
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_c]
  network_interface_ids = [
    azurerm_network_interface.nic_geewa_appserver_c.id,
  ]

 storage_os_disk {
    name              = var.vmosdiskname_geewa_appserver_c
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_appserver_c
    disk_size_gb      = var.vmosdisksize_geewa_appserver_c
  }

  storage_image_reference {
    publisher = var.imagepublisher_c
    offer     = var.imageoffer_c
    sku       = var.imagesku_c
    version   = "latest"
  }
    os_profile {
    computer_name  = var.vm_geewa_appserver_c
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
    os_profile_windows_config {
    provision_vm_agent = true
  }
}
resource "azurerm_public_ip" "pip_geewa_appserver_d_name" {
  name                = var.pip_geewa_appserver_d_name
  location            = var.location_d
  resource_group_name = var.rg_geewa_name_d
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_network_interface" "nic_geewa_appserver_d" {
  name                = var.nic_geewa_appserver_d
  location            = var.location_d
  resource_group_name = var.rg_geewa_name_d

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_d_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_d
    public_ip_address_id = azurerm_public_ip.pip_geewa_appserver_d_name.id
  }
}
resource "azurerm_virtual_machine" "vm_geewa_appserver_d" {
  name                = var.vm_geewa_appserver_d
  resource_group_name = var.rg_geewa_name_d
  location            = var.location_d
  vm_size                = var.vmsize_geewa_appserver_d
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_d]
  network_interface_ids = [
    azurerm_network_interface.nic_geewa_appserver_d.id,
  ]

 storage_os_disk {
    name              = var.vmosdiskname_geewa_appserver_d
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_appserver_d
    disk_size_gb      = var.vmosdisksize_geewa_appserver_d
  }

  storage_image_reference {
    publisher = var.imagepublisher_d
    offer     = var.imageoffer_d
    sku       = var.imagesku_d
    version   = "latest"
  }
    os_profile {
    computer_name  = var.vm_geewa_appserver_d
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
    os_profile_windows_config {
    provision_vm_agent = true
  }
}/*
resource "azurerm_network_interface" "nic_geewa_dbserver" {
  name                = var.nic_geewa_dbserver
  location            = var.location_c
  resource_group_name = var.rg_geewa_name_c

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_c_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_db
  }
}
resource "azurerm_virtual_machine" "vm_geewa_dbserver" {
  name                  = var.vm_geewa_dbserver
  location              = var.location_d
  resource_group_name   = var.rg_geewa_name_d
  network_interface_ids = [azurerm_network_interface.nic_geewa_dbserver.id]
  vm_size               = var.vmsize_geewa_dbserver
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver]

  storage_image_reference {
    publisher = var.imagepublisher_db
    offer     = var.imageoffer_db
    sku       = var.imagesku_db
    version   = "latest"
  }

  storage_os_disk {
    name              = var.vmosdiskname_geewa_dbserver
    caching           = "ReadOnly"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_dbserver
    disk_size_gb      = var.vmosdisksize_geewa_dbserver
  }

  os_profile {
    computer_name  = var.vm_geewa_dbserver
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    timezone                  = "Pacific Standard Time"
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }
}
# add a data disk - we were going to iterate through a collection 
/*
resource "azurerm_managed_disk" "datadisk_geewa_dbserver" {
    name                    = var.datadisk_geewa_dbserver 
    location                = var.location_c
    resource_group_name     = var.rg_geewa_name_c
    storage_account_type    = var.datadisk_type_dbserver
    create_option           = "Empty"
    disk_size_gb            = var.datadisksize_geewa_dbserver
}
resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_attach" {
    managed_disk_id    = azurerm_managed_disk.datadisk_geewa_dbserver.id
    virtual_machine_id = azurerm_virtual_machine.vm_geewa_dbserver.id
    lun                = 1
    caching            = "ReadWrite"
    depends_on            = [azurerm_managed_disk.datadisk_geewa_dbserver, azurerm_virtual_machine.vm_geewa_dbserver ]
}
resource "azurerm_mssql_virtual_machine" "sqlvm_geewa_dbserver" {
  virtual_machine_id = azurerm_virtual_machine.vm_geewa_dbserver.id
  sql_license_type   = var.sql_license_type
  r_services_enabled               = true
  sql_connectivity_port            = var.sql_connectivity_port
  sql_connectivity_type            = var.sql_connectivity_type
  sql_connectivity_update_password = var.sql_connectivity_update_password
  sql_connectivity_update_username = var.sql_connectivity_update_username
  depends_on            = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach, azurerm_virtual_machine.vm_geewa_dbserver]

  auto_patching {
    day_of_week                            = "Sunday"
    maintenance_window_duration_in_minutes = 60
    maintenance_window_starting_hour       = 2
  }
  #The storage_configuration block supports the following:
    storage_configuration {
        disk_type               = "NEW"                         # (Required) The type of disk configuration to apply to the SQL Server. Valid values include NEW, EXTEND, or ADD.
        storage_workload_type   = "OLTP"                        # (Required) The type of storage workload. Valid values include GENERAL, OLTP, or DW.
        # The storage_settings block supports the following:
        data_settings {
            default_file_path = var.sql_datafilepath     # (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun]
        }
        log_settings {
            default_file_path = var.sql_logfilepath     # (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun]                                 # (Required) A list of Logical Unit Numbers for the disks.
        }
        temp_db_settings {
            default_file_path = var.sql_tempdbfilepath   #- (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun] 
        }
    }
}
resource "azurerm_network_security_group" "nsg_geewa_appserver_c" {
  name                = var.nsg_geewa_appserver_c
  location            = var.location_c
  resource_group_name = var.rg_geewa_name_c
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_c]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389"]
    source_address_prefixes      = ["10.10.1.0/24","10.11.1.0/24","10.10.2.0/24"]
    destination_address_prefix = "*"
  } 
  security_rule {
    name                       = "PortAllowonWAN"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["443","80","9339"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  } 
  
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_appserver_c" {
  network_interface_id      = azurerm_network_interface.nic_geewa_appserver_c.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_appserver_c.id
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_c, azurerm_network_security_group.nsg_geewa_appserver_c]
}
resource "azurerm_network_security_group" "nsg_geewa_appserver_d" {
  name                = var.nsg_geewa_appserver_d
  location            = var.location_d
  resource_group_name = var.rg_geewa_name_d
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_d]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389"]
    source_address_prefixes      = ["10.10.1.0/24","10.11.1.0/24","10.10.2.0/24"]
    destination_address_prefix = "*"
  } 
  security_rule {
    name                       = "PortAllowonWAN"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["443","80","9339"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  } 
  
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_appserver_d" {
  network_interface_id      = azurerm_network_interface.nic_geewa_appserver_d.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_appserver_d.id
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_d, azurerm_network_security_group.nsg_geewa_appserver_d]
}
resource "azurerm_network_security_group" "nsg_geewa_db" {
  name                = var.nsg_geewa_db
  location            = var.location_c
  resource_group_name = var.rg_geewa_name_c
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389","1433"]
    source_address_prefixes      = ["10.10.1.0/24","10.11.1.0/24","10.10.2.0/24"]
    destination_address_prefix = "*"
  }   
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_db" {
  network_interface_id      = azurerm_network_interface.nic_geewa_dbserver.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_db.id
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver, azurerm_network_security_group.nsg_geewa_db]
}
*/
resource "azurerm_virtual_machine_extension" "Install_dotNet_IIS-c" {
  name                 = "install-dotNet-IIS-c"
  virtual_machine_id   = azurerm_virtual_machine.vm_geewa_appserver_c.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  depends_on            = [azurerm_virtual_machine.vm_geewa_appserver_c]

  protected_settings = <<SETTINGS
  {
   "commandToExecute": "powershell -encodedCommand ${textencodebase64(file(".\\virtualmachines\\InstallIIS.ps1"), "UTF-16LE")}"
  }
  SETTINGS
}
resource "azurerm_virtual_machine_extension" "Install_dotNet_IIS-d" {
  name                 = "Install_dotNet_IIS-d"
  virtual_machine_id   = azurerm_virtual_machine.vm_geewa_appserver_d.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  depends_on            = [azurerm_virtual_machine.vm_geewa_appserver_d]

  protected_settings = <<SETTINGS
  {
   "commandToExecute": "powershell -encodedCommand ${textencodebase64(file(".\\virtualmachines\\InstallIIS.ps1"), "UTF-16LE")}"
  }
  SETTINGS
}

/////////////////////////////////////////////////// E AND F ////////////////////////////////////////////////////////

resource "azurerm_public_ip" "pip_geewa_appserver_e_name" {
  name                = var.pip_geewa_appserver_e_name
  location            = var.location_e
  resource_group_name = var.rg_geewa_name_e
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_network_interface" "nic_geewa_appserver_e" {
  name                = var.nic_geewa_appserver_e
  location            = var.location_e
  resource_group_name = var.rg_geewa_name_e

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_e_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_e
    public_ip_address_id = azurerm_public_ip.pip_geewa_appserver_e_name.id
  }
}
resource "azurerm_virtual_machine" "vm_geewa_appserver_e" {
  name                = var.vm_geewa_appserver_e
  resource_group_name = var.rg_geewa_name_e
  location            = var.location_e
  vm_size                = var.vmsize_geewa_appserver_e
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_e]
  network_interface_ids = [
    azurerm_network_interface.nic_geewa_appserver_e.id,
  ]

 storage_os_disk {
    name              = var.vmosdiskname_geewa_appserver_e
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_appserver_e
    disk_size_gb      = var.vmosdisksize_geewa_appserver_e
  }

  storage_image_reference {
    publisher = var.imagepublisher_e
    offer     = var.imageoffer_e
    sku       = var.imagesku_e
    version   = "latest"
  }
    os_profile {
    computer_name  = var.vm_geewa_appserver_e
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
    os_profile_windows_config {
    provision_vm_agent = true
  }
}
resource "azurerm_public_ip" "pip_geewa_appserver_f_name" {
  name                = var.pip_geewa_appserver_f_name
  location            = var.location_f
  resource_group_name = var.rg_geewa_name_f
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_network_interface" "nic_geewa_appserver_f" {
  name                = var.nic_geewa_appserver_f
  location            = var.location_f
  resource_group_name = var.rg_geewa_name_f

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_f_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_f
    public_ip_address_id = azurerm_public_ip.pip_geewa_appserver_f_name.id
  }
}
resource "azurerm_virtual_machine" "vm_geewa_appserver_f" {
  name                = var.vm_geewa_appserver_f
  resource_group_name = var.rg_geewa_name_f
  location            = var.location_f
  vm_size                = var.vmsize_geewa_appserver_f
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_f]
  network_interface_ids = [
    azurerm_network_interface.nic_geewa_appserver_f.id,
  ]

 storage_os_disk {
    name              = var.vmosdiskname_geewa_appserver_f
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_appserver_f
    disk_size_gb      = var.vmosdisksize_geewa_appserver_f
  }

  storage_image_reference {
    publisher = var.imagepublisher_f
    offer     = var.imageoffer_f
    sku       = var.imagesku_f
    version   = "latest"
  }
    os_profile {
    computer_name  = var.vm_geewa_appserver_f
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
    os_profile_windows_config {
    provision_vm_agent = true
  }
}/*
resource "azurerm_network_interface" "nic_geewa_dbserver" {
  name                = var.nic_geewa_dbserver
  location            = var.location_e
  resource_group_name = var.rg_geewa_name_e

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_e_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_db
  }
}
resource "azurerm_virtual_machine" "vm_geewa_dbserver" {
  name                  = var.vm_geewa_dbserver
  location              = var.location_e
  resource_group_name   = var.rg_geewa_name_e
  network_interface_ids = [azurerm_network_interface.nic_geewa_dbserver.id]
  vm_size               = var.vmsize_geewa_dbserver
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver]

  storage_image_reference {
    publisher = var.imagepublisher_db
    offer     = var.imageoffer_db
    sku       = var.imagesku_db
    version   = "latest"
  }

  storage_os_disk {
    name              = var.vmosdiskname_geewa_dbserver
    caching           = "ReadOnly"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_dbserver
    disk_size_gb      = var.vmosdisksize_geewa_dbserver
  }

  os_profile {
    computer_name  = var.vm_geewa_dbserver
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    timezone                  = "Pacific Standard Time"
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }
}
# add a data disk - we were going to iterate through a collection
resource "azurerm_managed_disk" "datadisk_geewa_dbserver" {
    name                    = var.datadisk_geewa_dbserver 
    location                = var.location_e
    resource_group_name     = var.rg_geewa_name_e
    storage_account_type    = var.datadisk_type_dbserver
    create_option           = "Empty"
    disk_size_gb            = var.datadisksize_geewa_dbserver
}
resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_attach" {
    managed_disk_id    = azurerm_managed_disk.datadisk_geewa_dbserver.id
    virtual_machine_id = azurerm_virtual_machine.vm_geewa_dbserver.id
    lun                = 1
    caching            = "ReadWrite"
    depends_on            = [azurerm_managed_disk.datadisk_geewa_dbserver, azurerm_virtual_machine.vm_geewa_dbserver ]
}
resource "azurerm_mssql_virtual_machine" "sqlvm_geewa_dbserver" {
  virtual_machine_id = azurerm_virtual_machine.vm_geewa_dbserver.id
  sql_license_type   = var.sql_license_type
  r_services_enabled               = true
  sql_connectivity_port            = var.sql_connectivity_port
  sql_connectivity_type            = var.sql_connectivity_type
  sql_connectivity_update_password = var.sql_connectivity_update_password
  sql_connectivity_update_username = var.sql_connectivity_update_username
  depends_on            = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach, azurerm_virtual_machine.vm_geewa_dbserver]

  auto_patching {
    day_of_week                            = "Sunday"
    maintenance_window_duration_in_minutes = 60
    maintenance_window_starting_hour       = 2
  }
  #The storage_configuration block supports the following:
    storage_configuration {
        disk_type               = "NEW"                         # (Required) The type of disk configuration to apply to the SQL Server. Valid values include NEW, EXTEND, or ADD.
        storage_workload_type   = "OLTP"                        # (Required) The type of storage workload. Valid values include GENERAL, OLTP, or DW.
        # The storage_settings block supports the following:
        data_settings {
            default_file_path = var.sql_datafilepath     # (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun]
        }
        log_settings {
            default_file_path = var.sql_logfilepath     # (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun]                                 # (Required) A list of Logical Unit Numbers for the disks.
        }
        temp_db_settings {
            default_file_path = var.sql_tempdbfilepath   #- (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun] 
        }
    }
}
resource "azurerm_network_security_group" "nsg_geewa_appserver_e" {
  name                = var.nsg_geewa_appserver_e
  location            = var.location_e
  resource_group_name = var.rg_geewa_name_e
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_e]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389"]
    source_address_prefixes      = ["10.14.1.0/24","10.15.1.0/24","10.14.2.0/24"]
    destination_address_prefix = "*"
  } 
  security_rule {
    name                       = "PortAllowonWAN"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["443","80","9339"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  } 
  
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_appserver_e" {
  network_interface_id      = azurerm_network_interface.nic_geewa_appserver_e.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_appserver_e.id
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_e, azurerm_network_security_group.nsg_geewa_appserver_e]
}
resource "azurerm_network_security_group" "nsg_geewa_appserver_f" {
  name                = var.nsg_geewa_appserver_f
  location            = var.location_f
  resource_group_name = var.rg_geewa_name_f
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_f]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389"]
    source_address_prefixes      = ["10.14.1.0/24","10.15.1.0/24","10.14.2.0/24"]
    destination_address_prefix = "*"
  } 
  security_rule {
    name                       = "PortAllowonWAN"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["443","80","9339"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  } 
  
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_appserver_f" {
  network_interface_id      = azurerm_network_interface.nic_geewa_appserver_f.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_appserver_f.id
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_f, azurerm_network_security_group.nsg_geewa_appserver_f]
}
resource "azurerm_network_security_group" "nsg_geewa_db" {
  name                = var.nsg_geewa_db
  location            = var.location_e
  resource_group_name = var.rg_geewa_name_e
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389","1433"]
    source_address_prefixes      = ["10.14.1.0/24","10.15.1.0/24","10.11.2.0/24"]
    destination_address_prefix = "*"
  }   
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_db" {
  network_interface_id      = azurerm_network_interface.nic_geewa_dbserver.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_db.id
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver, azurerm_network_security_group.nsg_geewa_db]
}
*/
resource "azurerm_virtual_machine_extension" "Install_dotNet_IIS-e" {
  name                 = "install-dotNet-IIS-e"
  virtual_machine_id   = azurerm_virtual_machine.vm_geewa_appserver_e.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  depends_on            = [azurerm_virtual_machine.vm_geewa_appserver_e]

  protected_settings = <<SETTINGS
  {
   "commandToExecute": "powershell -encodedCommand ${textencodebase64(file(".\\virtualmachines\\InstallIIS.ps1"), "UTF-16LE")}"
  }
  SETTINGS
}
resource "azurerm_virtual_machine_extension" "Install_dotNet_IIS-f" {
  name                 = "Install_dotNet_IIS-f"
  virtual_machine_id   = azurerm_virtual_machine.vm_geewa_appserver_f.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  depends_on            = [azurerm_virtual_machine.vm_geewa_appserver_f]

  protected_settings = <<SETTINGS
  {
   "commandToExecute": "powershell -encodedCommand ${textencodebase64(file(".\\virtualmachines\\InstallIIS.ps1"), "UTF-16LE")}"
  }
  SETTINGS
}

/////////////////////////////////////////////////// G AND H ////////////////////////////////////////////////////////

resource "azurerm_public_ip" "pip_geewa_appserver_g_name" {
  name                = var.pip_geewa_appserver_g_name
  location            = var.location_g
  resource_group_name = var.rg_geewa_name_g
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_network_interface" "nic_geewa_appserver_g" {
  name                = var.nic_geewa_appserver_g
  location            = var.location_g
  resource_group_name = var.rg_geewa_name_g

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_g_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_g
    public_ip_address_id = azurerm_public_ip.pip_geewa_appserver_g_name.id
  }
}
resource "azurerm_virtual_machine" "vm_geewa_appserver_g" {
  name                = var.vm_geewa_appserver_g
  resource_group_name = var.rg_geewa_name_g
  location            = var.location_g
  vm_size                = var.vmsize_geewa_appserver_g
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_g]
  network_interface_ids = [
    azurerm_network_interface.nic_geewa_appserver_g.id,
  ]

 storage_os_disk {
    name              = var.vmosdiskname_geewa_appserver_g
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_appserver_g
    disk_size_gb      = var.vmosdisksize_geewa_appserver_g
  }

  storage_image_reference {
    publisher = var.imagepublisher_g
    offer     = var.imageoffer_g
    sku       = var.imagesku_g
    version   = "latest"
  }
    os_profile {
    computer_name  = var.vm_geewa_appserver_g
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
    os_profile_windows_config {
    provision_vm_agent = true
  }
}
resource "azurerm_public_ip" "pip_geewa_appserver_h_name" {
  name                = var.pip_geewa_appserver_h_name
  location            = var.location_h
  resource_group_name = var.rg_geewa_name_h
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_network_interface" "nic_geewa_appserver_h" {
  name                = var.nic_geewa_appserver_h
  location            = var.location_h
  resource_group_name = var.rg_geewa_name_h

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_h_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_h
    public_ip_address_id = azurerm_public_ip.pip_geewa_appserver_h_name.id
  }
}
resource "azurerm_virtual_machine" "vm_geewa_appserver_h" {
  name                = var.vm_geewa_appserver_h
  resource_group_name = var.rg_geewa_name_h
  location            = var.location_h
  vm_size                = var.vmsize_geewa_appserver_h
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_h]
  network_interface_ids = [
    azurerm_network_interface.nic_geewa_appserver_h.id,
  ]

 storage_os_disk {
    name              = var.vmosdiskname_geewa_appserver_h
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_appserver_h
    disk_size_gb      = var.vmosdisksize_geewa_appserver_h
  }

  storage_image_reference {
    publisher = var.imagepublisher_h
    offer     = var.imageoffer_h
    sku       = var.imagesku_h
    version   = "latest"
  }
    os_profile {
    computer_name  = var.vm_geewa_appserver_h
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
    os_profile_windows_config {
    provision_vm_agent = true
  }
}/*
resource "azurerm_network_interface" "nic_geewa_dbserver" {
  name                = var.nic_geewa_dbserver
  location            = var.location_g
  resource_group_name = var.rg_geewa_name_g

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_g_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_db
  }
}
resource "azurerm_virtual_machine" "vm_geewa_dbserver" {
  name                  = var.vm_geewa_dbserver
  location              = var.location_h
  resource_group_name   = var.rg_geewa_name_h
  network_interface_ids = [azurerm_network_interface.nic_geewa_dbserver.id]
  vm_size               = var.vmsize_geewa_dbserver
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver]

  storage_image_reference {
    publisher = var.imagepublisher_db
    offer     = var.imageoffer_db
    sku       = var.imagesku_db
    version   = "latest"
  }

  storage_os_disk {
    name              = var.vmosdiskname_geewa_dbserver
    caching           = "ReadOnly"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_dbserver
    disk_size_gb      = var.vmosdisksize_geewa_dbserver
  }

  os_profile {
    computer_name  = var.vm_geewa_dbserver
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    timezone                  = "Pacific Standard Time"
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }
}
# add a data disk - we were going to iterate through a collection
resource "azurerm_managed_disk" "datadisk_geewa_dbserver" {
    name                    = var.datadisk_geewa_dbserver 
    location                = var.location_g
    resource_group_name     = var.rg_geewa_name_g
    storage_account_type    = var.datadisk_type_dbserver
    create_option           = "Empty"
    disk_size_gb            = var.datadisksize_geewa_dbserver
}
resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_attach" {
    managed_disk_id    = azurerm_managed_disk.datadisk_geewa_dbserver.id
    virtual_machine_id = azurerm_virtual_machine.vm_geewa_dbserver.id
    lun                = 1
    caching            = "ReadWrite"
    depends_on            = [azurerm_managed_disk.datadisk_geewa_dbserver, azurerm_virtual_machine.vm_geewa_dbserver ]
}
resource "azurerm_mssql_virtual_machine" "sqlvm_geewa_dbserver" {
  virtual_machine_id = azurerm_virtual_machine.vm_geewa_dbserver.id
  sql_license_type   = var.sql_license_type
  r_services_enabled               = true
  sql_connectivity_port            = var.sql_connectivity_port
  sql_connectivity_type            = var.sql_connectivity_type
  sql_connectivity_update_password = var.sql_connectivity_update_password
  sql_connectivity_update_username = var.sql_connectivity_update_username
  depends_on            = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach, azurerm_virtual_machine.vm_geewa_dbserver]

  auto_patching {
    day_of_week                            = "Sunday"
    maintenance_window_duration_in_minutes = 60
    maintenance_window_starting_hour       = 2
  }
  #The storage_configuration block supports the following:
    storage_configuration {
        disk_type               = "NEW"                         # (Required) The type of disk configuration to apply to the SQL Server. Valid values include NEW, EXTEND, or ADD.
        storage_workload_type   = "OLTP"                        # (Required) The type of storage workload. Valid values include GENERAL, OLTP, or DW.
        # The storage_settings block supports the following:
        data_settings {
            default_file_path = var.sql_datafilepath     # (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun]
        }
        log_settings {
            default_file_path = var.sql_logfilepath     # (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun]                                 # (Required) A list of Logical Unit Numbers for the disks.
        }
        temp_db_settings {
            default_file_path = var.sql_tempdbfilepath   #- (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun] 
        }
    }
}
resource "azurerm_network_security_group" "nsg_geewa_appserver_g" {
  name                = var.nsg_geewa_appserver_g
  location            = var.location_g
  resource_group_name = var.rg_geewa_name_g
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_g]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389"]
    source_address_prefixes      = ["10.16.1.0/24","10.17.1.0/24","10.16.2.0/24"]
    destination_address_prefix = "*"
  } 
  security_rule {
    name                       = "PortAllowonWAN"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["443","80","9339"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }   
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_appserver_g" {
  network_interface_id      = azurerm_network_interface.nic_geewa_appserver_g.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_appserver_g.id
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_g, azurerm_network_security_group.nsg_geewa_appserver_g]
}
resource "azurerm_network_security_group" "nsg_geewa_appserver_h" {
  name                = var.nsg_geewa_appserver_h
  location            = var.location_h
  resource_group_name = var.rg_geewa_name_h
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_h]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389"]
    source_address_prefixes      = ["10.16.1.0/24","10.17.1.0/24","10.16.2.0/24"]
    destination_address_prefix = "*"
  } 
  security_rule {
    name                       = "PortAllowonWAN"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["443","80","9339"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  } 
  
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_appserver_h" {
  network_interface_id      = azurerm_network_interface.nic_geewa_appserver_h.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_appserver_h.id
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_h, azurerm_network_security_group.nsg_geewa_appserver_h]
}
resource "azurerm_network_security_group" "nsg_geewa_db" {
  name                = var.nsg_geewa_db
  location            = var.location_g
  resource_group_name = var.rg_geewa_name_g
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver]
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389","1433"]
    source_address_prefixes      = ["10.16.1.0/24","10.17.1.0/24","10.16.2.0/24"]
    destination_address_prefix = "*"
  }   
}
resource "azurerm_network_interface_security_group_association" "nsg_geewa_db" {
  network_interface_id      = azurerm_network_interface.nic_geewa_dbserver.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_db.id
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver, azurerm_network_security_group.nsg_geewa_db]
}*/
resource "azurerm_virtual_machine_extension" "Install_dotNet_IIS-g" {
  name                 = "install-dotNet-IIS-g"
  virtual_machine_id   = azurerm_virtual_machine.vm_geewa_appserver_g.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  depends_on            = [azurerm_virtual_machine.vm_geewa_appserver_g]

  protected_settings = <<SETTINGS
  {
   "commandToExecute": "powershell -encodedCommand ${textencodebase64(file(".\\virtualmachines\\InstallIIS.ps1"), "UTF-16LE")}"
  }
  SETTINGS
}
resource "azurerm_virtual_machine_extension" "Install_dotNet_IIS-h" {
  name                 = "Install_dotNet_IIS-h"
  virtual_machine_id   = azurerm_virtual_machine.vm_geewa_appserver_h.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  depends_on            = [azurerm_virtual_machine.vm_geewa_appserver_h]

  protected_settings = <<SETTINGS
  {
   "commandToExecute": "powershell -encodedCommand ${textencodebase64(file(".\\virtualmachines\\InstallIIS.ps1"), "UTF-16LE")}"
  }
  SETTINGS
}
