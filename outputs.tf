# Output load balancer public IP
output "lb_public_ip" {
  value = azurerm_public_ip.wp-ip.ip_address
}

# Get private IP of VM0
output "vm1_private_ip" {
  value = azurerm_network_interface.wp-nic[0].private_ip_address
}

# Get private IP of VM1 
output "vm2_private_ip" {
  value = azurerm_network_interface.wp-nic[1].private_ip_address
}

# Get IP of MySQL Private EndPoint 
output "mysql_private_endpoint_ip" {
  value = azurerm_private_endpoint.mysql-endpoint.private_service_connection[0].private_ip_address
}