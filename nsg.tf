# Configure a network security group rule to allow inbound traffic on ports 80 & 443 & 22
resource "azurerm_network_security_group" "wp-nsg" {
  name                = var.nsg-name
  location            = var.rg-location
  resource_group_name = var.rg-name
  depends_on          = [azurerm_resource_group.wp-rg]

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "AllowSSH"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "AllowHTTPS"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate the network security group with the virtual network subnet
resource "azurerm_subnet_network_security_group_association" "nsg-assoc" {
  subnet_id                 = azurerm_subnet.wp-subnet.id
  network_security_group_id = azurerm_network_security_group.wp-nsg.id
}