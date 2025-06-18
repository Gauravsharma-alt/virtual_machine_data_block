variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
  
  
}
variable "nsg_location" {
  description = "Location of the Network Security Group"
  type        = string
}
variable "rg_name" {
  description = "Resource Group Name for the Network Security Group"
  type        = string
}

variable "destination_port" {
  description = "Resource Group Name for the Network Security Group"
  type        = string
}
variable "nic_name" {
  description = "Name of the Network Interface to associate with the NSG"
  type        = string
  
}
