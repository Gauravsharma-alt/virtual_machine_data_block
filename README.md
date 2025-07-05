# Virtual_Machine_Deployment_By_Data_Block

A Terraform-based project for deploying a fully functional Virtual Machine on Microsoft Azure using reusable modules and data blocks. This setup includes infrastructure components such as Virtual Network, Subnet, Network Security Group (NSG), Public IP, Resource Group, Key Vault, and Virtual Machine.

## 🔧 Modules Used

This project is modularized for reusability and scalability. Each component is defined as an individual module:

- **Resource Group (`rg`)** – Defines and manages the Azure Resource Group.
- **Virtual Network (`vnet`)** – Creates a Virtual Network with address space.
- **Subnet (`subnet`)** – Configures subnets within the VNet.
- **Network Security Group (`nsg`)** – Sets up NSG rules for secure access.
- **Public IP (`public_ip`)** – Allocates a public IP for external access.
- **Virtual Machine (`virtual_machine`)** – Provisions the Azure VM with required configurations.
- **Key Vault (`keyvault`)** – Manages secrets and keys securely using Azure Key Vault.
- **Environment (`enviornment/prod`)** – Example environment-specific configuration for production deployment.

## 📁 Folder Structure

# 🚀 Azure Virtual Machine Deployment using Terraform

![Terraform](https://img.shields.io/badge/Terraform-v1.3%2B-blue?logo=terraform)
![Azure](https://img.shields.io/badge/Microsoft%20Azure-Cloud-blue?logo=microsoftazure)
![Infrastructure as Code](https://img.shields.io/badge/IaC-Terraform-brightgreen)
![Status](https://img.shields.io/badge/Status-Active-success)

A modular and production-ready Terraform project to deploy a complete Azure Virtual Machine environment using reusable components and `data` blocks. Ideal for learning, demos, and real-world infrastructure provisioning.

---

## 🧱 Project Modules

This project follows a modular architecture. Each Azure component is managed through separate, reusable Terraform modules.


## 📦 Technologies Used

- **Cloud**: Microsoft Azure ☁️  
- **IaC**: [Terraform](https://www.terraform.io/)  
- **Provisioning**: Azure CLI, Azure Portal  
- **DevOps Tools**: Git, Azure DevOps  

---

## ⚙️ How to Use

1. **Clone the repo**  
   ```bash
   git clone https://github.com/Gauravsharma-alt/virtual_machine_data_block.git
   cd virtual_machine_data_block/enviornment/prod
