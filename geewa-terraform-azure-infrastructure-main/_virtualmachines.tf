module "virtualmachines" {
  source = "./virtualmachines"

//////////////////////////////////////////////// A AND B ///////////////////////////////////////////////////////////

  location_a      = module.shared.location_a
  rg_geewa_name_a = module.shared.rg_geewa_name_a
  location_b = module.shared.location_b
  rg_geewa_name_b = module.shared.rg_geewa_name_b
  nic_geewa_appserver_a = local.workspace["nic_geewa_appserver_a"]
  nic_private_ip_a = local.workspace["nic_private_ip_a"]

  nic_geewa_appserver_b = local.workspace["nic_geewa_appserver_b"]
  nic_private_ip_b = local.workspace["nic_private_ip_b"]

  geewa_subnet_name_a_id = module.shared.geewa_subnet_name_a_id
  geewa_subnet_name_b_id = module.shared.geewa_subnet_name_b_id

  vm_geewa_appserver_a = local.workspace["vm_geewa_appserver_a"]
  vmsize_geewa_appserver_a = local.workspace["vmsize_geewa_appserver_a"]
  vmosdiskname_geewa_appserver_a = local.workspace["vmosdiskname_geewa_appserver_a"]
  vmosdisktype_geewa_appserver_a = local.workspace["vmosdisktype_geewa_appserver_a"]
  imagepublisher_a = local.workspace["imagepublisher_a"]
  imageoffer_a = local.workspace["imageoffer_a"]
  imagesku_a = local.workspace["imagesku_a"]
  admin_username = local.workspace["admin_username"]
  admin_password = local.workspace["admin_password"]
  vmosdisksize_geewa_appserver_a = local.workspace["vmosdisksize_geewa_appserver_a"]

  vm_geewa_appserver_b = local.workspace["vm_geewa_appserver_b"]
  vmsize_geewa_appserver_b = local.workspace["vmsize_geewa_appserver_b"]
  vmosdiskname_geewa_appserver_b = local.workspace["vmosdiskname_geewa_appserver_b"]
  vmosdisksize_geewa_appserver_b = local.workspace["vmosdisksize_geewa_appserver_b"]
  vmosdisktype_geewa_appserver_b = local.workspace["vmosdisktype_geewa_appserver_b"]
  imagepublisher_b = local.workspace["imagepublisher_b"]
  imageoffer_b = local.workspace["imageoffer_b"]
  imagesku_b = local.workspace["imagesku_b"]

  nic_geewa_dbserver = local.workspace["nic_geewa_dbserver"]
  nic_private_ip_db = local.workspace["nic_private_ip_db"]
  
  vm_geewa_dbserver = local.workspace["vm_geewa_dbserver"]
  vmsize_geewa_dbserver = local.workspace["vmsize_geewa_dbserver"]
  vmosdisksize_geewa_dbserver = local.workspace["vmosdisksize_geewa_dbserver"]
  vmosdisktype_geewa_dbserver = local.workspace["vmosdisktype_geewa_dbserver"]
  vmosdiskname_geewa_dbserver = local.workspace["vmosdiskname_geewa_dbserver"]
  imagepublisher_db = local.workspace["imagepublisher_db"]
  imageoffer_db = local.workspace["imageoffer_db"]
  imagesku_db = local.workspace["imagesku_db"]
  datadisk_geewa_dbserver = local.workspace["datadisk_geewa_dbserver"]
  datadisk_type_dbserver = local.workspace["datadisk_type_dbserver"]
  datadisksize_geewa_dbserver = local.workspace["datadisksize_geewa_dbserver"]
  sql_license_type = local.workspace["sql_license_type"]
  sql_connectivity_port = local.workspace["sql_connectivity_port"]
  sql_connectivity_type = local.workspace["sql_connectivity_type"]
  sql_connectivity_update_username = local.workspace["sql_connectivity_update_username"]
  sql_connectivity_update_password = local.workspace["sql_connectivity_update_password"]
  sql_datafilepath = local.workspace["sql_datafilepath"]
  sql_logfilepath = local.workspace["sql_logfilepath"]
  sql_tempdbfilepath = local.workspace["sql_tempdbfilepath"]

  nsg_geewa_db = local.workspace["nsg_geewa_db"]
  nsg_geewa_appserver_a = local.workspace["nsg_geewa_appserver_a"]
  nsg_geewa_appserver_b = local.workspace["nsg_geewa_appserver_b"]

  pip_geewa_appserver_a_name = local.workspace["pip_geewa_appserver_a_name"]
  pip_geewa_appserver_b_name = local.workspace["pip_geewa_appserver_b_name"]

//////////////////////////////////////////////// C AND D ///////////////////////////////////////////////////////////
  
  location_c      = module.shared.location_c
  rg_geewa_name_c = module.shared.rg_geewa_name_c
  location_d = module.shared.location_d
  rg_geewa_name_d = module.shared.rg_geewa_name_d
  nic_geewa_appserver_c = local.workspace["nic_geewa_appserver_c"]
  nic_private_ip_c = local.workspace["nic_private_ip_c"]

  nic_geewa_appserver_d = local.workspace["nic_geewa_appserver_d"]
  nic_private_ip_d = local.workspace["nic_private_ip_d"]

  geewa_subnet_name_c_id = module.shared.geewa_subnet_name_c_id
  geewa_subnet_name_d_id = module.shared.geewa_subnet_name_d_id

  vm_geewa_appserver_c = local.workspace["vm_geewa_appserver_c"]
  vmsize_geewa_appserver_c = local.workspace["vmsize_geewa_appserver_c"]
  vmosdiskname_geewa_appserver_c = local.workspace["vmosdiskname_geewa_appserver_c"]
  vmosdisktype_geewa_appserver_c = local.workspace["vmosdisktype_geewa_appserver_c"]
  imagepublisher_c = local.workspace["imagepublisher_c"]
  imageoffer_c = local.workspace["imageoffer_c"]
  imagesku_c = local.workspace["imagesku_c"]
  //admin_username = local.workspace["admin_username"]
  //admin_password = local.workspace["admin_password"]
  vmosdisksize_geewa_appserver_c = local.workspace["vmosdisksize_geewa_appserver_c"]

  vm_geewa_appserver_d = local.workspace["vm_geewa_appserver_d"]
  vmsize_geewa_appserver_d = local.workspace["vmsize_geewa_appserver_d"]
  vmosdiskname_geewa_appserver_d = local.workspace["vmosdiskname_geewa_appserver_d"]
  vmosdisksize_geewa_appserver_d = local.workspace["vmosdisksize_geewa_appserver_d"]
  vmosdisktype_geewa_appserver_d = local.workspace["vmosdisktype_geewa_appserver_d"]
  imagepublisher_d = local.workspace["imagepublisher_d"]
  imageoffer_d = local.workspace["imageoffer_d"]
  imagesku_d = local.workspace["imagesku_d"]
  /*
  nic_geewa_dbserver_d = local.workspace["nic_geewa_dbserver_d"]
  nic_private_ip_db = local.workspace["nic_private_ip_db"]
  
  vm_geewa_dbserver = local.workspace["vm_geewa_dbserver"]
  vmsize_geewa_dbserver = local.workspace["vmsize_geewa_dbserver"]
  vmosdisksize_geewa_dbserver = local.workspace["vmosdisksize_geewa_dbserver"]
  vmosdisktype_geewa_dbserver = local.workspace["vmosdisktype_geewa_dbserver"]
  vmosdiskname_geewa_dbserver = local.workspace["vmosdiskname_geewa_dbserver"]
  imagepublisher_db = local.workspace["imagepublisher_db"]
  imageoffer_db = local.workspace["imageoffer_db"]
  imagesku_db = local.workspace["imagesku_db"]
  datadisk_geewa_dbserver = local.workspace["datadisk_geewa_dbserver"]
  datadisk_type_dbserver = local.workspace["datadisk_type_dbserver"]
  datadisksize_geewa_dbserver = local.workspace["datadisksize_geewa_dbserver"]
  sql_license_type = local.workspace["sql_license_type"]
  sql_connectivity_port = local.workspace["sql_connectivity_port"]
  sql_connectivity_type = local.workspace["sql_connectivity_type"]
  sql_connectivity_update_username = local.workspace["sql_connectivity_update_username"]
  sql_connectivity_update_password = local.workspace["sql_connectivity_update_password"]
  sql_datafilepath = local.workspace["sql_datafilepath"]
  sql_logfilepath = local.workspace["sql_logfilepath"]
  sql_tempdbfilepath = local.workspace["sql_tempdbfilepath"]

  nsg_geewa_db = local.workspace["nsg_geewa_db"]
  nsg_geewa_appserver_c = local.workspace["nsg_geewa_appserver_c"]
  nsg_geewa_appserver_d = local.workspace["nsg_geewa_appserver_d"]
  */
  pip_geewa_appserver_c_name = local.workspace["pip_geewa_appserver_c_name"]
  pip_geewa_appserver_d_name = local.workspace["pip_geewa_appserver_d_name"]

//////////////////////////////////////////////// E AND F ///////////////////////////////////////////////////////////

  location_e      = module.shared.location_e
  rg_geewa_name_e = module.shared.rg_geewa_name_e
  location_f = module.shared.location_f
  rg_geewa_name_f = module.shared.rg_geewa_name_f
  
  nic_geewa_appserver_e = local.workspace["nic_geewa_appserver_e"]
  nic_private_ip_e = local.workspace["nic_private_ip_e"]

  nic_geewa_appserver_f = local.workspace["nic_geewa_appserver_f"]
  nic_private_ip_f = local.workspace["nic_private_ip_f"]

  geewa_subnet_name_e_id = module.shared.geewa_subnet_name_e_id
  geewa_subnet_name_f_id = module.shared.geewa_subnet_name_f_id

  vm_geewa_appserver_e = local.workspace["vm_geewa_appserver_e"]
  vmsize_geewa_appserver_e = local.workspace["vmsize_geewa_appserver_e"]
  vmosdiskname_geewa_appserver_e = local.workspace["vmosdiskname_geewa_appserver_e"]
  vmosdisktype_geewa_appserver_e = local.workspace["vmosdisktype_geewa_appserver_e"]
  imagepublisher_e = local.workspace["imagepublisher_e"]
  imageoffer_e = local.workspace["imageoffer_e"]
  imagesku_e = local.workspace["imagesku_e"]
  //admin_username = local.workspace["admin_username"]
  //admin_password = local.workspace["admin_password"]
  vmosdisksize_geewa_appserver_e = local.workspace["vmosdisksize_geewa_appserver_e"]

  vm_geewa_appserver_f = local.workspace["vm_geewa_appserver_f"]
  vmsize_geewa_appserver_f = local.workspace["vmsize_geewa_appserver_f"]
  vmosdiskname_geewa_appserver_f = local.workspace["vmosdiskname_geewa_appserver_f"]
  vmosdisksize_geewa_appserver_f = local.workspace["vmosdisksize_geewa_appserver_f"]
  vmosdisktype_geewa_appserver_f = local.workspace["vmosdisktype_geewa_appserver_f"]
  imagepublisher_f = local.workspace["imagepublisher_f"]
  imageoffer_f = local.workspace["imageoffer_f"]
  imagesku_f = local.workspace["imagesku_f"]
  /*
  nic_geewa_dbserver = local.workspace["nic_geewa_dbserver"]
  nic_private_ip_db = local.workspace["nic_private_ip_db"]
  
  vm_geewa_dbserver = local.workspace["vm_geewa_dbserver"]
  vmsize_geewa_dbserver = local.workspace["vmsize_geewa_dbserver"]
  vmosdisksize_geewa_dbserver = local.workspace["vmosdisksize_geewa_dbserver"]
  vmosdisktype_geewa_dbserver = local.workspace["vmosdisktype_geewa_dbserver"]
  vmosdiskname_geewa_dbserver = local.workspace["vmosdiskname_geewa_dbserver"]
  imagepublisher_db = local.workspace["imagepublisher_db"]
  imageoffer_db = local.workspace["imageoffer_db"]
  imagesku_db = local.workspace["imagesku_db"]
  datadisk_geewa_dbserver = local.workspace["datadisk_geewa_dbserver"]
  datadisk_type_dbserver = local.workspace["datadisk_type_dbserver"]
  datadisksize_geewa_dbserver = local.workspace["datadisksize_geewa_dbserver"]
  sql_license_type = local.workspace["sql_license_type"]
  sql_connectivity_port = local.workspace["sql_connectivity_port"]
  sql_connectivity_type = local.workspace["sql_connectivity_type"]
  sql_connectivity_update_username = local.workspace["sql_connectivity_update_username"]
  sql_connectivity_update_password = local.workspace["sql_connectivity_update_password"]
  sql_datafilepath = local.workspace["sql_datafilepath"]
  sql_logfilepath = local.workspace["sql_logfilepath"]
  sql_tempdbfilepath = local.workspace["sql_tempdbfilepath"]

  nsg_geewa_db = local.workspace["nsg_geewa_db"]
  nsg_geewa_appserver_e = local.workspace["nsg_geewa_appserver_e"]
  nsg_geewa_appserver_f = local.workspace["nsg_geewa_appserver_f"]
  */
  pip_geewa_appserver_e_name = local.workspace["pip_geewa_appserver_e_name"]
  pip_geewa_appserver_f_name = local.workspace["pip_geewa_appserver_f_name"]

//////////////////////////////////////////////// E AND F ///////////////////////////////////////////////////////////

  location_g      = module.shared.location_g
  rg_geewa_name_g = module.shared.rg_geewa_name_g
  location_h = module.shared.location_h
  rg_geewa_name_h = module.shared.rg_geewa_name_h

  nic_geewa_appserver_g = local.workspace["nic_geewa_appserver_g"]
  nic_private_ip_g = local.workspace["nic_private_ip_g"]

  nic_geewa_appserver_h = local.workspace["nic_geewa_appserver_h"]
  nic_private_ip_h = local.workspace["nic_private_ip_h"]

  geewa_subnet_name_g_id = module.shared.geewa_subnet_name_g_id
  geewa_subnet_name_h_id = module.shared.geewa_subnet_name_h_id

  vm_geewa_appserver_g = local.workspace["vm_geewa_appserver_g"]
  vmsize_geewa_appserver_g = local.workspace["vmsize_geewa_appserver_g"]
  vmosdiskname_geewa_appserver_g = local.workspace["vmosdiskname_geewa_appserver_g"]
  vmosdisktype_geewa_appserver_g = local.workspace["vmosdisktype_geewa_appserver_g"]
  imagepublisher_g = local.workspace["imagepublisher_g"]
  imageoffer_g = local.workspace["imageoffer_g"]
  imagesku_g = local.workspace["imagesku_g"]
  //admin_username = local.workspace["admin_username"]
  //admin_password = local.workspace["admin_password"]
  vmosdisksize_geewa_appserver_g = local.workspace["vmosdisksize_geewa_appserver_g"]

  vm_geewa_appserver_h = local.workspace["vm_geewa_appserver_h"]
  vmsize_geewa_appserver_h = local.workspace["vmsize_geewa_appserver_h"]
  vmosdiskname_geewa_appserver_h = local.workspace["vmosdiskname_geewa_appserver_h"]
  vmosdisksize_geewa_appserver_h = local.workspace["vmosdisksize_geewa_appserver_h"]
  vmosdisktype_geewa_appserver_h = local.workspace["vmosdisktype_geewa_appserver_h"]
  imagepublisher_h = local.workspace["imagepublisher_h"]
  imageoffer_h = local.workspace["imageoffer_h"]
  imagesku_h = local.workspace["imagesku_h"]
  /*
  nic_geewa_dbserver = local.workspace["nic_geewa_dbserver"]
  nic_private_ip_db = local.workspace["nic_private_ip_db"]
  
  vm_geewa_dbserver = local.workspace["vm_geewa_dbserver"]
  vmsize_geewa_dbserver = local.workspace["vmsize_geewa_dbserver"]
  vmosdisksize_geewa_dbserver = local.workspace["vmosdisksize_geewa_dbserver"]
  vmosdisktype_geewa_dbserver = local.workspace["vmosdisktype_geewa_dbserver"]
  vmosdiskname_geewa_dbserver = local.workspace["vmosdiskname_geewa_dbserver"]
  imagepublisher_db = local.workspace["imagepublisher_db"]
  imageoffer_db = local.workspace["imageoffer_db"]
  imagesku_db = local.workspace["imagesku_db"]
  datadisk_geewa_dbserver = local.workspace["datadisk_geewa_dbserver"]
  datadisk_type_dbserver = local.workspace["datadisk_type_dbserver"]
  datadisksize_geewa_dbserver = local.workspace["datadisksize_geewa_dbserver"]
  sql_license_type = local.workspace["sql_license_type"]
  sql_connectivity_port = local.workspace["sql_connectivity_port"]
  sql_connectivity_type = local.workspace["sql_connectivity_type"]
  sql_connectivity_update_username = local.workspace["sql_connectivity_update_username"]
  sql_connectivity_update_password = local.workspace["sql_connectivity_update_password"]
  sql_datafilepath = local.workspace["sql_datafilepath"]
  sql_logfilepath = local.workspace["sql_logfilepath"]
  sql_tempdbfilepath = local.workspace["sql_tempdbfilepath"]

  nsg_geewa_db = local.workspace["nsg_geewa_db"]
  nsg_geewa_appserver_g = local.workspace["nsg_geewa_appserver_g"]
  nsg_geewa_appserver_h = local.workspace["nsg_geewa_appserver_h"]
  */
  pip_geewa_appserver_g_name = local.workspace["pip_geewa_appserver_g_name"]
  pip_geewa_appserver_h_name = local.workspace["pip_geewa_appserver_h_name"]
}