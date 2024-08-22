# main.tf
resource "azurerm_resource_group" "main" {
  name     = "rg-flask-app"
  location = var.location
}
