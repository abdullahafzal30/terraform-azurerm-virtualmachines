module "shared" {
  source = "./shared"

  location_a      = local.workspace["location_a"]
  rg_geewa_name_a = local.workspace["rg_geewa_name_a"]
  geewa_subnet_name_a = local.workspace["geewa_subnet_name_a"]
  geewa_subnet_address_prefix_a = local.workspace["geewa_subnet_address_prefix_a"]
  geewa_vnet_address_prefix_a = local.workspace["geewa_vnet_address_prefix_a"]
  geewa_vnet_name_a = local.workspace["geewa_vnet_name_a"]

  location_b = local.workspace["location_b"]
  rg_geewa_name_b = local.workspace["rg_geewa_name_b"]
  geewa_subnet_name_b = local.workspace["geewa_subnet_name_b"]
  geewa_subnet_address_prefix_b = local.workspace["geewa_subnet_address_prefix_b"]
  geewa_vnet_address_prefix_b = local.workspace["geewa_vnet_address_prefix_b"]
  geewa_vnet_name_b = local.workspace["geewa_vnet_name_b"]
  peering_geewa_vnet_a_to_geewa_vnet_b_name = local.workspace["peering_geewa_vnet_a_to_geewa_vnet_b_name"]
  peering_geewa_vnet_b_to_geewa_vnet_a_name = local.workspace["peering_geewa_vnet_b_to_geewa_vnet_a_name"]

  bastion_subnet_name = local.workspace["bastion_subnet_name"]
  bastion_subnet_address_prefix = local.workspace["bastion_subnet_address_prefix"]

  bastion_publicip_name = local.workspace["bastion_publicip_name"]
  bastion_host_name = local.workspace["bastion_host_name"]

////////////////////////////////////////// C AND D ///////////////////////////////////////////////////////////

  location_c      = local.workspace["location_c"]
  rg_geewa_name_c = local.workspace["rg_geewa_name_c"]
  geewa_subnet_name_c = local.workspace["geewa_subnet_name_c"]
  geewa_subnet_address_prefix_c = local.workspace["geewa_subnet_address_prefix_c"]
  geewa_vnet_address_prefix_c = local.workspace["geewa_vnet_address_prefix_c"]
  geewa_vnet_name_c = local.workspace["geewa_vnet_name_c"]

  location_d = local.workspace["location_d"]
  rg_geewa_name_d = local.workspace["rg_geewa_name_d"]
  geewa_subnet_name_d = local.workspace["geewa_subnet_name_d"]
  geewa_subnet_address_prefix_d = local.workspace["geewa_subnet_address_prefix_d"]
  geewa_vnet_address_prefix_d = local.workspace["geewa_vnet_address_prefix_d"]
  geewa_vnet_name_d = local.workspace["geewa_vnet_name_d"]
  peering_geewa_vnet_c_to_geewa_vnet_d_name = local.workspace["peering_geewa_vnet_c_to_geewa_vnet_d_name"]
  peering_geewa_vnet_d_to_geewa_vnet_c_name = local.workspace["peering_geewa_vnet_d_to_geewa_vnet_c_name"]

  //bastion_subnet_name = local.workspace["bastion_subnet_name"]
  //bastion_subnet_address_prefix = local.workspace["bastion_subnet_address_prefix"]

  //bastion_publicip_name = local.workspace["bastion_publicip_name"]
  //bastion_host_name = local.workspace["bastion_host_name"]

  ////////////////////////////////////////// E AND F /////////////////////////////////////////////////////////

  location_e      = local.workspace["location_e"]
  rg_geewa_name_e = local.workspace["rg_geewa_name_e"]
  geewa_subnet_name_e = local.workspace["geewa_subnet_name_e"]
  geewa_subnet_address_prefix_e = local.workspace["geewa_subnet_address_prefix_e"]
  geewa_vnet_address_prefix_e = local.workspace["geewa_vnet_address_prefix_e"]
  geewa_vnet_name_e = local.workspace["geewa_vnet_name_e"]

  location_f = local.workspace["location_f"]
  rg_geewa_name_f = local.workspace["rg_geewa_name_f"]
  geewa_subnet_name_f = local.workspace["geewa_subnet_name_f"]
  geewa_subnet_address_prefix_f = local.workspace["geewa_subnet_address_prefix_f"]
  geewa_vnet_address_prefix_f = local.workspace["geewa_vnet_address_prefix_f"]
  geewa_vnet_name_f = local.workspace["geewa_vnet_name_f"]
  peering_geewa_vnet_e_to_geewa_vnet_f_name = local.workspace["peering_geewa_vnet_e_to_geewa_vnet_f_name"]
  peering_geewa_vnet_f_to_geewa_vnet_e_name = local.workspace["peering_geewa_vnet_f_to_geewa_vnet_e_name"]

  //bastion_subnet_name = local.workspace["bastion_subnet_name"]
  //bastion_subnet_address_prefix = local.workspace["bastion_subnet_address_prefix"]

  //bastion_publicip_name = local.workspace["bastion_publicip_name"]
  //bastion_host_name = local.workspace["bastion_host_name"]

  /////////////////////////////////////////////// G AND H /////////////////////////////////////////////////////////

  location_g      = local.workspace["location_g"]
  rg_geewa_name_g = local.workspace["rg_geewa_name_g"]
  geewa_subnet_name_g = local.workspace["geewa_subnet_name_g"]
  geewa_subnet_address_prefix_g = local.workspace["geewa_subnet_address_prefix_g"]
  geewa_vnet_address_prefix_g = local.workspace["geewa_vnet_address_prefix_g"]
  geewa_vnet_name_g = local.workspace["geewa_vnet_name_g"]

  location_h = local.workspace["location_h"]
  rg_geewa_name_h = local.workspace["rg_geewa_name_h"]
  geewa_subnet_name_h = local.workspace["geewa_subnet_name_h"]
  geewa_subnet_address_prefix_h = local.workspace["geewa_subnet_address_prefix_h"]
  geewa_vnet_address_prefix_h = local.workspace["geewa_vnet_address_prefix_h"]
  geewa_vnet_name_h = local.workspace["geewa_vnet_name_h"]
  peering_geewa_vnet_g_to_geewa_vnet_h_name = local.workspace["peering_geewa_vnet_g_to_geewa_vnet_h_name"]
  peering_geewa_vnet_h_to_geewa_vnet_g_name = local.workspace["peering_geewa_vnet_h_to_geewa_vnet_g_name"]

  //bastion_subnet_name = local.workspace["bastion_subnet_name"]
  //bastion_subnet_address_prefix = local.workspace["bastion_subnet_address_prefix"]

  //bastion_publicip_name = local.workspace["bastion_publicip_name"]
  //bastion_host_name = local.workspace["bastion_host_name"]
} 