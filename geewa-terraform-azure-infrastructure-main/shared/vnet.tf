resource "azurerm_virtual_network" "geewa_vnet_name_a" {
  name                = var.geewa_vnet_name_a
  location            = azurerm_resource_group.rg_geewa_name_a.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_a.name
  address_space = [var.geewa_vnet_address_prefix_a]
  depends_on = [azurerm_resource_group.rg_geewa_name_a]
}
resource "azurerm_subnet" "geewa_subnet_name_a" {
  name                 = var.geewa_subnet_name_a
  address_prefixes     = [var.geewa_subnet_address_prefix_a]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_a.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_a.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_a]
}
resource "azurerm_virtual_network" "geewa_vnet_name_b" {
  name                = var.geewa_vnet_name_b
  location            = azurerm_resource_group.rg_geewa_name_b.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_b.name
  address_space = [var.geewa_vnet_address_prefix_b]
  depends_on = [azurerm_resource_group.rg_geewa_name_b]
}
resource "azurerm_subnet" "geewa_subnet_name_b" {
  name                 = var.geewa_subnet_name_b
  address_prefixes     = [var.geewa_subnet_address_prefix_b]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_b.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_b.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_b]
}
resource "azurerm_virtual_network_peering" "peering_geewa_vnet_a_to_geewa_vnet_b_name" {
  name                      = var.peering_geewa_vnet_a_to_geewa_vnet_b_name
  resource_group_name       = azurerm_resource_group.rg_geewa_name_b.name
  virtual_network_name      = azurerm_virtual_network.geewa_vnet_name_b.name
  remote_virtual_network_id = azurerm_virtual_network.geewa_vnet_name_a.id
  allow_virtual_network_access = true
  depends_on = [azurerm_virtual_network.geewa_vnet_name_b,azurerm_virtual_network.geewa_vnet_name_b]
}
resource "azurerm_virtual_network_peering" "peering_geewa_vnet_b_to_geewa_vnet_a_name" {
  name                      = var.peering_geewa_vnet_b_to_geewa_vnet_a_name
  resource_group_name       = azurerm_resource_group.rg_geewa_name_a.name
  virtual_network_name      = azurerm_virtual_network.geewa_vnet_name_a.name
  remote_virtual_network_id = azurerm_virtual_network.geewa_vnet_name_b.id
  allow_virtual_network_access = true
  depends_on = [azurerm_virtual_network.geewa_vnet_name_b,azurerm_virtual_network.geewa_vnet_name_b]
}
resource "azurerm_subnet" "bastion_subnet_name" {
  name                 = var.bastion_subnet_name
  address_prefixes     = [var.bastion_subnet_address_prefix]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_a.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_a.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_a]
}
resource "azurerm_public_ip" "bastion_publicip_name" {
  name                = var.bastion_publicip_name
  location            = azurerm_resource_group.rg_geewa_name_a.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_a.name
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on = [azurerm_resource_group.rg_geewa_name_a]
}
resource "azurerm_bastion_host" "bastion_host_name" {
  name                = var.bastion_host_name
  location            = azurerm_resource_group.rg_geewa_name_a.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_a.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_subnet_name.id
    public_ip_address_id = azurerm_public_ip.bastion_publicip_name.id
  }
  depends_on = [azurerm_public_ip.bastion_publicip_name, azurerm_subnet.bastion_subnet_name]
}
/////////////////////////////////////////////// C AND D //////////////////////////////////////////////////////////////
resource "azurerm_virtual_network" "geewa_vnet_name_c" {
  name                = var.geewa_vnet_name_c
  location            = azurerm_resource_group.rg_geewa_name_c.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_c.name
  address_space = [var.geewa_vnet_address_prefix_c]
  depends_on = [azurerm_resource_group.rg_geewa_name_c]
}
resource "azurerm_subnet" "geewa_subnet_name_c" {
  name                 = var.geewa_subnet_name_c
  address_prefixes     = [var.geewa_subnet_address_prefix_c]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_c.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_c.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_c]
}
resource "azurerm_virtual_network" "geewa_vnet_name_d" {
  name                = var.geewa_vnet_name_d
  location            = azurerm_resource_group.rg_geewa_name_d.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_d.name
  address_space = [var.geewa_vnet_address_prefix_d]
  depends_on = [azurerm_resource_group.rg_geewa_name_d]
}
resource "azurerm_subnet" "geewa_subnet_name_d" {
  name                 = var.geewa_subnet_name_d
  address_prefixes     = [var.geewa_subnet_address_prefix_d]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_d.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_d.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_d]
}
resource "azurerm_virtual_network_peering" "peering_geewa_vnet_c_to_geewa_vnet_d_name" {
  name                      = var.peering_geewa_vnet_c_to_geewa_vnet_d_name
  resource_group_name       = azurerm_resource_group.rg_geewa_name_d.name
  virtual_network_name      = azurerm_virtual_network.geewa_vnet_name_d.name
  remote_virtual_network_id = azurerm_virtual_network.geewa_vnet_name_c.id
  allow_virtual_network_access = true
  depends_on = [azurerm_virtual_network.geewa_vnet_name_d,azurerm_virtual_network.geewa_vnet_name_d]
}
resource "azurerm_virtual_network_peering" "peering_geewa_vnet_d_to_geewa_vnet_c_name" {
  name                      = var.peering_geewa_vnet_d_to_geewa_vnet_c_name
  resource_group_name       = azurerm_resource_group.rg_geewa_name_c.name
  virtual_network_name      = azurerm_virtual_network.geewa_vnet_name_c.name
  remote_virtual_network_id = azurerm_virtual_network.geewa_vnet_name_d.id
  allow_virtual_network_access = true
  depends_on = [azurerm_virtual_network.geewa_vnet_name_d,azurerm_virtual_network.geewa_vnet_name_d]
}
/*
resource "azurerm_subnet" "bastion_subnet_name" {
  name                 = var.bastion_subnet_name
  address_prefixes     = [var.bastion_subnet_address_prefix]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_c.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_c.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_c]
}
resource "azurerm_public_ip" "bastion_publicip_name" {
  name                = var.bastion_publicip_name
  location            = azurerm_resource_group.rg_geewa_name_c.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_c.name
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on = [azurerm_resource_group.rg_geewa_name_c]
}
resource "azurerm_bastion_host" "bastion_host_name" {
  name                = var.bastion_host_name
  location            = azurerm_resource_group.rg_geewa_name_c.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_c.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_subnet_name.id
    public_ip_address_id = azurerm_public_ip.bastion_publicip_name.id
  }
  depends_on = [azurerm_public_ip.bastion_publicip_name, azurerm_subnet.bastion_subnet_name]
}
*/
//////////////////////////////////////////////// E AND F //////////////////////////////////////////////////////////

resource "azurerm_virtual_network" "geewa_vnet_name_e" {
  name                = var.geewa_vnet_name_e
  location            = azurerm_resource_group.rg_geewa_name_e.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_e.name
  address_space = [var.geewa_vnet_address_prefix_e]
  depends_on = [azurerm_resource_group.rg_geewa_name_e]
}
resource "azurerm_subnet" "geewa_subnet_name_e" {
  name                 = var.geewa_subnet_name_e
  address_prefixes     = [var.geewa_subnet_address_prefix_e]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_e.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_e.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_e]
}
resource "azurerm_virtual_network" "geewa_vnet_name_f" {
  name                = var.geewa_vnet_name_f
  location            = azurerm_resource_group.rg_geewa_name_f.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_f.name
  address_space = [var.geewa_vnet_address_prefix_f]
  depends_on = [azurerm_resource_group.rg_geewa_name_f]
}
resource "azurerm_subnet" "geewa_subnet_name_f" {
  name                 = var.geewa_subnet_name_f
  address_prefixes     = [var.geewa_subnet_address_prefix_f]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_f.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_f.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_f]
}
resource "azurerm_virtual_network_peering" "peering_geewa_vnet_e_to_geewa_vnet_f_name" {
  name                      = var.peering_geewa_vnet_e_to_geewa_vnet_f_name
  resource_group_name       = azurerm_resource_group.rg_geewa_name_f.name
  virtual_network_name      = azurerm_virtual_network.geewa_vnet_name_f.name
  remote_virtual_network_id = azurerm_virtual_network.geewa_vnet_name_e.id
  allow_virtual_network_access = true
  depends_on = [azurerm_virtual_network.geewa_vnet_name_f,azurerm_virtual_network.geewa_vnet_name_f]
}
resource "azurerm_virtual_network_peering" "peering_geewa_vnet_f_to_geewa_vnet_e_name" {
  name                      = var.peering_geewa_vnet_f_to_geewa_vnet_e_name
  resource_group_name       = azurerm_resource_group.rg_geewa_name_e.name
  virtual_network_name      = azurerm_virtual_network.geewa_vnet_name_e.name
  remote_virtual_network_id = azurerm_virtual_network.geewa_vnet_name_f.id
  allow_virtual_network_access = true
  depends_on = [azurerm_virtual_network.geewa_vnet_name_f,azurerm_virtual_network.geewa_vnet_name_f]
}
/*
resource "azurerm_subnet" "bastion_subnet_name" {
  name                 = var.bastion_subnet_name
  address_prefixes     = [var.bastion_subnet_address_prefix]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_e.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_e.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_e]
}
resource "azurerm_public_ip" "bastion_publicip_name" {
  name                = var.bastion_publicip_name
  location            = azurerm_resource_group.rg_geewa_name_e.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_e.name
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on = [azurerm_resource_group.rg_geewa_name_e]
}
resource "azurerm_bastion_host" "bastion_host_name" {
  name                = var.bastion_host_name
  location            = azurerm_resource_group.rg_geewa_name_e.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_e.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_subnet_name.id
    public_ip_address_id = azurerm_public_ip.bastion_publicip_name.id
  }
  depends_on = [azurerm_public_ip.bastion_publicip_name, azurerm_subnet.bastion_subnet_name]
}*/

///////////////////////////////////////////// G AND H //////////////////////////////////////////////////////////////

resource "azurerm_virtual_network" "geewa_vnet_name_g" {
  name                = var.geewa_vnet_name_g
  location            = azurerm_resource_group.rg_geewa_name_g.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_g.name
  address_space = [var.geewa_vnet_address_prefix_g]
  depends_on = [azurerm_resource_group.rg_geewa_name_g]
}
resource "azurerm_subnet" "geewa_subnet_name_g" {
  name                 = var.geewa_subnet_name_g
  address_prefixes     = [var.geewa_subnet_address_prefix_g]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_g.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_g.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_g]
}
resource "azurerm_virtual_network" "geewa_vnet_name_h" {
  name                = var.geewa_vnet_name_h
  location            = azurerm_resource_group.rg_geewa_name_h.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_h.name
  address_space = [var.geewa_vnet_address_prefix_h]
  depends_on = [azurerm_resource_group.rg_geewa_name_h]
}
resource "azurerm_subnet" "geewa_subnet_name_h" {
  name                 = var.geewa_subnet_name_h
  address_prefixes     = [var.geewa_subnet_address_prefix_h]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_h.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_h.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_h]
}
resource "azurerm_virtual_network_peering" "peering_geewa_vnet_g_to_geewa_vnet_h_name" {
  name                      = var.peering_geewa_vnet_g_to_geewa_vnet_h_name
  resource_group_name       = azurerm_resource_group.rg_geewa_name_h.name
  virtual_network_name      = azurerm_virtual_network.geewa_vnet_name_h.name
  remote_virtual_network_id = azurerm_virtual_network.geewa_vnet_name_g.id
  allow_virtual_network_access = true
  depends_on = [azurerm_virtual_network.geewa_vnet_name_h,azurerm_virtual_network.geewa_vnet_name_h]
}
resource "azurerm_virtual_network_peering" "peering_geewa_vnet_h_to_geewa_vnet_g_name" {
  name                      = var.peering_geewa_vnet_h_to_geewa_vnet_g_name
  resource_group_name       = azurerm_resource_group.rg_geewa_name_g.name
  virtual_network_name      = azurerm_virtual_network.geewa_vnet_name_g.name
  remote_virtual_network_id = azurerm_virtual_network.geewa_vnet_name_h.id
  allow_virtual_network_access = true
  depends_on = [azurerm_virtual_network.geewa_vnet_name_h,azurerm_virtual_network.geewa_vnet_name_h]
}/*
resource "azurerm_subnet" "bastion_subnet_name" {
  name                 = var.bastion_subnet_name
  address_prefixes     = [var.bastion_subnet_address_prefix]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_g.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_g.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_g]
}
resource "azurerm_public_ip" "bastion_publicip_name" {
  name                = var.bastion_publicip_name
  location            = azurerm_resource_group.rg_geewa_name_g.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_g.name
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on = [azurerm_resource_group.rg_geewa_name_g]
}
resource "azurerm_bastion_host" "bastion_host_name" {
  name                = var.bastion_host_name
  location            = azurerm_resource_group.rg_geewa_name_g.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_g.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_subnet_name.id
    public_ip_address_id = azurerm_public_ip.bastion_publicip_name.id
  }
  depends_on = [azurerm_public_ip.bastion_publicip_name, azurerm_subnet.bastion_subnet_name]
}*/
