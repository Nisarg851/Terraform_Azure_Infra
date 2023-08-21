output "n01579649-vmlinux" {
    value = {
        ids = values(azurerm_linux_virtual_machine.n01579649-vmlinux)[*].id
        hostnames = values(azurerm_linux_virtual_machine.n01579649-vmlinux)[*].name
        nic_ids = values(azurerm_linux_virtual_machine.n01579649-vmlinux)[*].network_interface_ids[0]
        }
}

output "nic_id" {
    value = values(azurerm_linux_virtual_machine.n01579649-vmlinux)[*].network_interface_ids[0]
}

output "n01579649-vmlinux-FQDN" {
    value = values(azurerm_public_ip.n01579649-pip)[*].fqdn
}

output "n01579649-vmlinux-private-ip" {
    value = values(azurerm_linux_virtual_machine.n01579649-vmlinux)[*].private_ip_address
}

output "n01579649-vmlinux-public-ip" {
  value = values(azurerm_linux_virtual_machine.n01579649-vmlinux)[*].public_ip_address
}