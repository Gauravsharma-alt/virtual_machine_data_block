variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}
variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}
variable "pip_name" {
  description = "Name of the Public IP"
  type        = string

}
variable "nic_name" {
  description = "Name of the Network Interface"
  type        = string
}
variable "nic_location" {
  description = "Location of the Network Interface"
  type        = string
}



variable "virtual_machine" {
    description = "Name of the Virtual Machine"
    type        = string
  
}
variable "virtual_machine_location" {
    description = "Name of the Virtual Machine"
    type        = string
  
}

