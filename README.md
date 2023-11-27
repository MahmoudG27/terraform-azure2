# Those files terraform for creating resource in Azure
# It will be create resource group, Vnet, Subnet, two private linux VMs, Flexible MySQL server, Public Load balancer ,private EndPoint, Network security group (NSG).

##############################################################################

1) Private Endpoint will be created in MySQL to use IP in same subnet with VMs.
2) public load balancer handle the traffic to two VMs.
3) after creation a script install.sh running in two VMs and use MySQL server in wordpress. so if you make change in file terraform.tfvars in MySQL you should return to script to update change in values of variable params.
4) After creation go to resource Flexible MySQL server. Under the SETTINGS section, click Server parameters to open the server parameters page. search on require_secure_transport and change it to OFF. this in case you don't use SSL.

##############################################################################