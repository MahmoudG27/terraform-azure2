rg-location = "North Europe"
rg-name     = "terraform"

address-vnet   = "10.1.0.0/16"
address-subnet = "10.1.0.0/24"
name-vnet      = "wp-vnet"
name-subnet    = "wp-subnet"

nsg-name = "wp-nsg"

offer-vm       = "0001-com-ubuntu-server-focal"
sku-vm         = "20_04-lts"
vm-size        = "Standard_DS2_v2"
vm-version     = "latest"
admin-vm       = "mahmoud"
adminpasswd-vm = "Password123@"

mysql-name          = "wordpress-mysql-mg"
mysql-user          = "mahmoud"
mysql-user-password = "P@ssw0rd123@"
mysql-version       = "8.0.21"
mysql-sku           = "GP_Standard_D2ds_v4"