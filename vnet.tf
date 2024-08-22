# vnet.tf
resource "azurerm_virtual_network" "main" {
  name                = "vnet-flask-app"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = [var.address_space]
}

resource "azurerm_subnet" "main" { 
  name                 = "subnet-flask-app"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_prefix]
  
}
