variable "kv_name" {
    description = "The name of the Key Vault"
    type        = string
}
variable "location" {
    description = "The Azure region where the Key Vault will be created"
    type        = string
}
variable "rg_name" {
    description = "The name of the resource group where the Key Vault will be created"
    type        = string
}
variable "vmusername1" {
    description = "The username for the virtual machine"
    type        = string
}
variable "vmpassword1" {
    description = "The password for the virtual machine"
    type        = string
}
variable "vmusername2" {
    description = "The username for the virtual machine"
    type        = string
}
variable "vmpassword2" {
    description = "The password for the virtual machine"
    type        = string
}

