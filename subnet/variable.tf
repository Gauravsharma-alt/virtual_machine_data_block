variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string

}
variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string

}
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  
}
variable "address_prefixes" {
  description = "Address prefixes for the Subnet"
  type        = list(string)
}
