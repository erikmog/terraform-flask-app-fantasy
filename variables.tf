# variables.tf
variable "location" {
  description = "Azure region to deploy resources"
  default     = "Norway East"
}

variable "admin_username" {
  description = "Admin username for the VM"
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  default     = "Password1234!"
  sensitive   = true
}

variable "address_space" {
  description = "The address space for the Virtual Network"
  default     = "10.0.0.0/16"
}

variable "subnet_prefix" {
  description = "The address prefix for the Subnet"
  default     = "10.0.1.0/24"
}
