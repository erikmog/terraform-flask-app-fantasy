# nsg.tf
resource "azurerm_network_security_group" "main" { 
  name                = "nsg-flask-app"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "allow_ssh"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name   # Explicitly reference the resource group
  network_security_group_name = azurerm_network_security_group.main.name  # Explicitly reference the NSG
}

resource "azurerm_network_security_rule" "allow_https" {
  name                        = "allow_https"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name   # Explicitly reference the resource group
  network_security_group_name = azurerm_network_security_group.main.name  # Explicitly reference the NSG
}

resource "azurerm_network_security_rule" "deny_all_inbound" { 
  name                        = "deny_all_inbound"
  priority                    = 4096
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name   # Explicitly reference the resource group
  network_security_group_name = azurerm_network_security_group.main.name  # Explicitly reference the NSG
}
