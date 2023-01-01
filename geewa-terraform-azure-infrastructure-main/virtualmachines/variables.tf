
variable "location_a" {
    type        = string
    description = "location_a"
}
variable "rg_geewa_name_a" {
    type        = string
    description = "resource group name"
}
variable "location_b" {
    type        = string
    description = "location_b"
}
variable "rg_geewa_name_b" {
    type        = string
    description = "resource group name"
}
variable "nic_geewa_appserver_a" {
    type        = string
    description = "NIC for App Server A"
}
variable "geewa_subnet_name_a_id" {
    type        = string
    description = "NIC for App Server A"
}
variable "geewa_subnet_name_b_id" {
    type        = string
    description = "NIC for App Server B"
}
variable "nic_private_ip_a" {
    type        = string
     
}
variable "vm_geewa_appserver_a" {
    type        = string
     
}
variable "vmsize_geewa_appserver_a" {
    type        = string
     
}
variable "vmosdiskname_geewa_appserver_a" {
    type        = string
     
}
variable "vmosdisktype_geewa_appserver_a" {
    type        = string
     
}
variable "imagepublisher_a" {
    type        = string
     
}
variable "imageoffer_a" {
    type        = string
     
}
variable "imagesku_a" {
    type        = string
     
}
variable "admin_username" {
    type        = string
     
}
variable "admin_password" {
    type        = string
     
}
variable "vmosdisksize_geewa_appserver_a" {
    type        = string
     
}
variable "nic_geewa_appserver_b" {
    type        = string
     
}
variable "nic_private_ip_b" {
    type        = string
     
}
variable "vm_geewa_appserver_b" {
    type        = string
     
}
variable "vmsize_geewa_appserver_b" {
    type        = string
     
}
variable "vmosdiskname_geewa_appserver_b" {
    type        = string
     
}
variable "vmosdisksize_geewa_appserver_b" {
    type        = string
     
}
variable "vmosdisktype_geewa_appserver_b" {
    type        = string
     
}
variable "imagepublisher_b" {
    type        = string
     
}
variable "imageoffer_b" {
    type        = string
     
}
variable "imagesku_b" {
    type        = string
     
}
variable "nic_geewa_dbserver" {
    type        = string
     
}
variable "nic_private_ip_db" {
    type        = string
     
}
variable "vm_geewa_dbserver" {
    type        = string
     
}
variable "vmsize_geewa_dbserver" {
    type        = string
     
}
variable "vmosdisksize_geewa_dbserver" {
    type        = string
     
}
variable "vmosdisktype_geewa_dbserver" {
    type        = string
     
}
variable "vmosdiskname_geewa_dbserver" {
    type        = string
     
}
variable "imagepublisher_db" {
    type        = string
     
}
variable "imageoffer_db" {
    type        = string
     
}
variable "imagesku_db" {
    type        = string
     
}
variable "datadisk_geewa_dbserver" {
    type        = string
     
}
variable "datadisk_type_dbserver" {
    type        = string
     
}
variable "datadisksize_geewa_dbserver" {
    type        = string
     
}
variable "sql_license_type" {
    type        = string
}    
variable "sql_connectivity_port" {
    type        = string
     
}
variable "sql_connectivity_type" {
    type        = string
     
}
variable "sql_connectivity_update_username" {
    type        = string
     
}
variable "sql_connectivity_update_password" {
    type        = string
     
}
variable "sql_datafilepath" {
    type        = string
     
}
variable "sql_logfilepath" {
    type        = string
     
}
variable "sql_tempdbfilepath" {
    type        = string
     
}
variable "nsg_geewa_db" {
    type        = string
     
}
variable "nsg_geewa_appserver_a" {
    type        = string
     
}
variable "nsg_geewa_appserver_b" {
    type        = string
     
}
variable scfile{
    type = string
    default = ".\\virtualmachines\\InstallIIS.ps1"
}
variable "pip_geewa_appserver_a_name" {
    type        = string
     
}
variable "pip_geewa_appserver_b_name" {
    type        = string
}

//////////////////////////////////////////// C AND D /////////////////////////////////////////////////////

variable "location_c" {
    type        = string
    description = "location_a"
}
variable "rg_geewa_name_c" {
    type        = string
    description = "resource group name"
}
variable "location_d" {
    type        = string
    description = "location_b"
}
variable "rg_geewa_name_d" {
    type        = string
    description = "resource group name"
}
variable "nic_geewa_appserver_c" {
    type        = string
    description = "NIC for App Server A"
}
variable "geewa_subnet_name_c_id" {
    type        = string
    description = "NIC for App Server A"
}
variable "geewa_subnet_name_d_id" {
    type        = string
    description = "NIC for App Server A"
}
variable "nic_private_ip_c" {
    type        = string
     
}
variable "vm_geewa_appserver_c" {
    type        = string
     
}
variable "vmsize_geewa_appserver_c" {
    type        = string
     
}
variable "vmosdiskname_geewa_appserver_c" {
    type        = string
     
}
variable "vmosdisktype_geewa_appserver_c" {
    type        = string
     
}
variable "imagepublisher_c" {
    type        = string
     
}
variable "imageoffer_c" {
    type        = string
     
}
variable "imagesku_c" {
    type        = string
     
}
/*
variable "admin_username" {
    type        = string
     
}
variable "admin_password" {
    type        = string
     
}
*/
variable "vmosdisksize_geewa_appserver_c" {
    type        = string
     
}
variable "nic_geewa_appserver_d" {
    type        = string
     
}
variable "nic_private_ip_d" {
    type        = string
     
}
variable "vm_geewa_appserver_d" {
    type        = string
     
}
variable "vmsize_geewa_appserver_d" {
    type        = string
     
}
variable "vmosdiskname_geewa_appserver_d" {
    type        = string
     
}
variable "vmosdisksize_geewa_appserver_d" {
    type        = string
     
}
variable "vmosdisktype_geewa_appserver_d" {
    type        = string
     
}
variable "imagepublisher_d" {
    type        = string
     
}
variable "imageoffer_d" {
    type        = string
     
}
variable "imagesku_d" {
    type        = string
     
}
/*
variable "nic_geewa_dbserver" {
    type        = string
     
}
variable "nic_private_ip_db" {
    type        = string
     
}
variable "vm_geewa_dbserver" {
    type        = string
     
}
variable "vmsize_geewa_dbserver" {
    type        = string
     
}
variable "vmosdisksize_geewa_dbserver" {
    type        = string
     
}
variable "vmosdisktype_geewa_dbserver" {
    type        = string
     
}
variable "vmosdiskname_geewa_dbserver" {
    type        = string
     
}
variable "imagepublisher_db" {
    type        = string
     
}
variable "imageoffer_db" {
    type        = string
     
}
variable "imagesku_db" {
    type        = string
     
}
variable "datadisk_geewa_dbserver" {
    type        = string
     
}
variable "datadisk_type_dbserver" {
    type        = string
     
}
variable "datadisksize_geewa_dbserver" {
    type        = string
     
}
variable "sql_license_type" {
    type        = string
     
}
variable "sql_connectivity_port" {
    type        = string
     
}
variable "sql_connectivity_type" {
    type        = string
     
}
variable "sql_connectivity_update_username" {
    type        = string
     
}
variable "sql_connectivity_update_password" {
    type        = string
     
}
variable "sql_datafilepath" {
    type        = string
     
}
variable "sql_logfilepath" {
    type        = string
     
}
variable "sql_tempdbfilepath" {
    type        = string
     
}
variable "nsg_geewa_db" {
    type        = string
     
}
variable "nsg_geewa_appserver_c" {
    type        = string
     
}
variable "nsg_geewa_appserver_d" {
    type        = string
     
}
variable scfile{
    type = string
    default = ".\\virtualmachines\\InstallIIS.ps1"
}
*/
variable "pip_geewa_appserver_c_name" {
    type        = string
     
}
variable "pip_geewa_appserver_d_name" {
    type        = string
}
////////////////////////////////////////////// E AND F //////////////////////////////////////////////////////

variable "location_e" {
    type        = string
    description = "location_e"
}
variable "rg_geewa_name_e" {
    type        = string
    description = "resource group name"
}
variable "location_f" {
    type        = string
    description = "location_f"
}
variable "rg_geewa_name_f" {
    type        = string
    description = "resource group name"
}
variable "nic_geewa_appserver_e" {
    type        = string
    description = "NIC for App Server E"
}
variable "geewa_subnet_name_e_id" {
    type        = string
    description = "NIC for App Server E"
}
variable "geewa_subnet_name_f_id" {
    type        = string
    description = "NIC for App Server F"
}
variable "nic_private_ip_e" {
    type        = string
     
}
variable "vm_geewa_appserver_e" {
    type        = string
     
}
variable "vmsize_geewa_appserver_e" {
    type        = string
     
}
variable "vmosdiskname_geewa_appserver_e" {
    type        = string
     
}
variable "vmosdisktype_geewa_appserver_e" {
    type        = string
     
}
variable "imagepublisher_e" {
    type        = string
     
}
variable "imageoffer_e" {
    type        = string
     
}
variable "imagesku_e" {
    type        = string
     
}/*
variable "admin_username" {
    type        = string
     
}
variable "admin_password" {
    type        = string
     
}*/
variable "vmosdisksize_geewa_appserver_e" {
    type        = string
     
}
variable "nic_geewa_appserver_f" {
    type        = string
     
}
variable "nic_private_ip_f" {
    type        = string
     
}
variable "vm_geewa_appserver_f" {
    type        = string
     
}
variable "vmsize_geewa_appserver_f" {
    type        = string
     
}
variable "vmosdiskname_geewa_appserver_f" {
    type        = string
     
}
variable "vmosdisksize_geewa_appserver_f" {
    type        = string
     
}
variable "vmosdisktype_geewa_appserver_f" {
    type        = string
     
}
variable "imagepublisher_f" {
    type        = string
     
}
variable "imageoffer_f" {
    type        = string
     
}
variable "imagesku_f" {
    type        = string
     
}/*
variable "nic_geewa_dbserver" {
    type        = string
     
}
variable "nic_private_ip_db" {
    type        = string
     
}
variable "vm_geewa_dbserver" {
    type        = string
     
}
variable "vmsize_geewa_dbserver" {
    type        = string
     
}
variable "vmosdisksize_geewa_dbserver" {
    type        = string
     
}
variable "vmosdisktype_geewa_dbserver" {
    type        = string
     
}
variable "vmosdiskname_geewa_dbserver" {
    type        = string
     
}
variable "imagepublisher_db" {
    type        = string
     
}
variable "imageoffer_db" {
    type        = string
     
}
variable "imagesku_db" {
    type        = string
     
}
variable "datadisk_geewa_dbserver" {
    type        = string
     
}
variable "datadisk_type_dbserver" {
    type        = string
     
}
variable "datadisksize_geewa_dbserver" {
    type        = string
     
}
variable "sql_license_type" {
    type        = string
     
}
variable "sql_connectivity_port" {
    type        = string
     
}
variable "sql_connectivity_type" {
    type        = string
     
}
variable "sql_connectivity_update_username" {
    type        = string
     
}
variable "sql_connectivity_update_password" {
    type        = string
     
}
variable "sql_datafilepath" {
    type        = string
     
}
variable "sql_logfilepath" {
    type        = string
     
}
variable "sql_tempdbfilepath" {
    type        = string
     
}
variable "nsg_geewa_db" {
    type        = string     
}
variable "nsg_geewa_appserver_e" {
    type        = string
     
}
variable "nsg_geewa_appserver_f" {
    type        = string
     
}
variable scfile{
    type = string
    default = ".\\virtualmachines\\InstallIIS.ps1"
}*/
variable "pip_geewa_appserver_e_name" {
    type        = string
     
}
variable "pip_geewa_appserver_f_name" {
    type        = string
}

////////////////////////////////////////////////// G AND H //////////////////////////////////////////////////////

variable "location_g" {
    type        = string
    description = "location_g"
}
variable "rg_geewa_name_g" {
    type        = string
    description = "resource group name"
}
variable "location_h" {
    type        = string
    description = "location_h"
}
variable "rg_geewa_name_h" {
    type        = string
    description = "resource group name"
}
variable "nic_geewa_appserver_g" {
    type        = string
    description = "NIC for App Server G"
}
variable "geewa_subnet_name_g_id" {
    type        = string
    description = "NIC for App Server G"
}
variable "geewa_subnet_name_h_id" {
    type        = string
    description = "NIC for App Server H"
}
variable "nic_private_ip_g" {
    type        = string
     
}
variable "vm_geewa_appserver_g" {
    type        = string
     
}
variable "vmsize_geewa_appserver_g" {
    type        = string    
}
variable "vmosdiskname_geewa_appserver_g" {
    type        = string
     
}
variable "vmosdisktype_geewa_appserver_g" {
    type        = string
     
}
variable "imagepublisher_g" {
    type        = string
     
}
variable "imageoffer_g" {
    type        = string
     
}
variable "imagesku_g" {
    type        = string
     
}/*
variable "admin_username" {
    type        = string
     
}
variable "admin_password" {
    type        = string
     
}*/
variable "vmosdisksize_geewa_appserver_g" {
    type        = string
     
}
variable "nic_geewa_appserver_h" {
    type        = string
     
}
variable "nic_private_ip_h" {
    type        = string
     
}
variable "vm_geewa_appserver_h" {
    type        = string
     
}
variable "vmsize_geewa_appserver_h" {
    type        = string
     
}
variable "vmosdiskname_geewa_appserver_h" {
    type        = string
     
}
variable "vmosdisksize_geewa_appserver_h" {
    type        = string
     
}
variable "vmosdisktype_geewa_appserver_h" {
    type        = string
     
}
variable "imagepublisher_h" {
    type        = string
     
}
variable "imageoffer_h" {
    type        = string
     
}
variable "imagesku_h" {
    type        = string
     
}/*
variable "nic_geewa_dbserver" {
    type        = string
     
}
variable "nic_private_ip_db" {
    type        = string
     
}
variable "vm_geewa_dbserver" {
    type        = string
     
}
variable "vmsize_geewa_dbserver" {
    type        = string
     
}
variable "vmosdisksize_geewa_dbserver" {
    type        = string
     
}
variable "vmosdisktype_geewa_dbserver" {
    type        = string
     
}
variable "vmosdiskname_geewa_dbserver" {
    type        = string
     
}
variable "imagepublisher_db" {
    type        = string
     
}
variable "imageoffer_db" {
    type        = string
     
}
variable "imagesku_db" {
    type        = string
     
}
variable "datadisk_geewa_dbserver" {
    type        = string
     
}
variable "datadisk_type_dbserver" {
    type        = string     
}
variable "datadisksize_geewa_dbserver" {
    type        = string    
}
variable "sql_license_type" {
    type        = string     
}
variable "sql_connectivity_port" {
    type        = string    
}
variable "sql_connectivity_type" {
    type        = string     
}
variable "sql_connectivity_update_username" {
    type        = string     
}
variable "sql_connectivity_update_password" {
    type        = string     
}
variable "sql_datafilepath" {
    type        = string     
}
variable "sql_logfilepath" {
    type        = string     
}
variable "sql_tempdbfilepath" {
    type        = string
}     
variable "nsg_geewa_db" {
    type        = string     
}
variable "nsg_geewa_appserver_g" {
    type        = string     
}
variable "nsg_geewa_appserver_h" {
    type        = string
}
variable scfile{
    type = string
    default = ".\\virtualmachines\\InstallIIS.ps1"
}*/
variable "pip_geewa_appserver_g_name" {
    type        = string     
}
variable "pip_geewa_appserver_h_name" {
    type        = string
}
