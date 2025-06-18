variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string

  
}
variable "vnet_location" {
  description = "Location of the Virtual Network"
  type        = string
  
}
variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}
variable "address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}