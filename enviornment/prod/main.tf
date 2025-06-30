# this is key_vault
# new add feture 


module "rg" {
    source = "../../rg"
    rg_name = "moonrise-rg"
    location = "canada east"
  
}
module "vnet" {
    depends_on = [ module.rg ]
    source = "../../vnet"
    vnet_name = "moonrise-vnet"
    vnet_location = "canada east"
    rg_name = "moonrise-rg"
    address_space = ["10.0.0.0/16"]
}
module "frontend_subnet" {
    depends_on = [ module.vnet ]    
    source = "../../subnet"
    subnet_name = "moonrise-subnet"
    rg_name = "moonrise-rg"
    vnet_name = "moonrise-vnet"
    address_prefixes = ["10.0.1.0/24"]
}
    
module "backend_subnet" {
    depends_on = [ module.vnet ]
    source = "../../subnet"
    subnet_name = "moonrise-backend-subnet"
    rg_name = "moonrise-rg"
    vnet_name = "moonrise-vnet"
    address_prefixes = ["10.0.2.0/24"]
}

module "pip1" {
    depends_on = [ module.rg ]
    source = "../../public_ip"
    public_ip_name = "sunrise-public-ip1"
    rg_name = "sunrise-rg"
    public_ip_location = "canada east"
}
module "pip2" {
    depends_on = [ module.rg ]
    source = "../../public_ip"
    public_ip_name = "sunrise-public-ip2"
    rg_name = "sunrise-rg"
    public_ip_location = "canada east"
}

module "nsg1" {
    depends_on = [ module.rg ]
    source = "../../nsg"
    nsg_name = "moonrise-nsg"
    nsg_location = "canada east"
    rg_name = "moonrise-rg"
    destination_port = "80"
    nic_name = "moonrise-nic1"

  
}
module "nsg2" {
    depends_on = [ module.rg ]
    source = "../../nsg"
    nsg_name = "moonrise-nsg-backend"
    nsg_location = "canada east"
    rg_name = "moonrise-rg"
    destination_port = "80"
    nic_name = "moonrise-nic2"

}
module "key_vault" {
    depends_on = [ module.rg ]
    source = "../../keyvault"
    kv_name = "moonrise-kv003"
    location = "canada east"
    rg_name = "moonrise-rg"
    vmusername1 = "azureuser"
    vmpassword1 = "P@ssw0rd1234!"
    vmusername2 = "azureuser2"
    vmpassword2 = "P@ssw0rd5678!"
}



module "virtual_machine_fronted" {
    depends_on = [ module.pip1, module.frontend_subnet ]
    source = "../../virtual_machine"
    subnet_name = "moonrise-subnet"
    vnet_name = "moonrise-vnet"  
    rg_name = "moonrise-rg"
    pip_name = "moonrise-public-ip1"
    nic_name = "moonrise-nic1"
    nic_location = "canada east"
    virtual_machine = "my-fronted-vm"
    virtual_machine_location = "canada east"

}
module "virtual_machine_backend" {
    depends_on = [ module.pip2, module.backend_subnet ]
    source = "../../virtual_machine"
    subnet_name = "moonrise-backend-subnet"
    vnet_name = "moonrise-vnet"  
    rg_name = "moonrise-rg"
    pip_name = "moonrise-public-ip2"
    nic_name = "moonrise-nic2"
    nic_location = "canada east"
    virtual_machine = "my-backend-vm"
    virtual_machine_location = "canada east"

}