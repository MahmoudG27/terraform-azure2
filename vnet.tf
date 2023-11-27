#Create Virtual Networks > Create Spoke Virtual Network
resource "azurerm_virtual_network" "wp-vnet" {
  name                = var.name-vnet
  location            = var.rg-location
  resource_group_name = var.rg-name
  address_space       = [var.address-vnet]
  depends_on          = [azurerm_resource_group.wp-rg]
}

#Create Subnet1 for VMs
resource "azurerm_subnet" "wp-subnet" {
  name                 = var.name-subnet
  resource_group_name  = var.rg-name
  virtual_network_name = azurerm_virtual_network.wp-vnet.name
  address_prefixes     = [var.address-subnet]
}

#Create Private Network Interfaces
resource "azurerm_network_interface" "wp-nic" {
  count               = 2
  name                = "wp-nic-${count.index}"
  location            = var.rg-location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = "wp-nic-config-${count.index}"
    subnet_id                     = azurerm_subnet.wp-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create an Azure public IP address For Load Balancer
resource "azurerm_public_ip" "wp-ip" {
  name                = "publicIPForLB"
  location            = var.rg-location
  resource_group_name = var.rg-name
  sku                 = "Standard"
  allocation_method   = "Static"
  depends_on          = [azurerm_resource_group.wp-rg]
}