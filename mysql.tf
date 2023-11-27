# Create an Azure mysql flexible server
resource "azurerm_mysql_flexible_server" "wp-mysql-server" {
  name                   = var.mysql-name
  resource_group_name    = var.rg-name
  location               = var.rg-location
  administrator_login    = var.mysql-user
  administrator_password = var.mysql-user-password
  backup_retention_days  = 7
  sku_name               = var.mysql-sku
  version                = var.mysql-version
  depends_on             = [azurerm_resource_group.wp-rg]
}

# Create Private EndPoint to associate to MySQL Server
resource "azurerm_private_endpoint" "mysql-endpoint" {
  name                = "mysql-endpoint"
  location            = var.rg-location
  resource_group_name = var.rg-name
  subnet_id           = azurerm_subnet.wp-subnet.id

  private_service_connection {
    name                           = "my-private-mysql-connection"
    private_connection_resource_id = azurerm_mysql_flexible_server.wp-mysql-server.id
    subresource_names              = ["mysqlServer"]
    is_manual_connection           = false
  }
  
  ip_configuration {
    name               = "endpoint-nic"
    subresource_name   = "mysqlServer"
    private_ip_address = "10.1.0.10"
  }
}