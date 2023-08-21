output "n01579649-vmwindows" {
    value = {
        ids = azurerm_windows_virtual_machine.n01579649-vmwindows[*].id
        hostnames = azurerm_windows_virtual_machine.n01579649-vmwindows[*].name
        }
}

output "n01579649-vmwindows-FQDN" {
    value = azurerm_public_ip.n01579649-vmwindows-pip[*].fqdn
}

output "n01579649-vmwindows-private-ip" {
    value = azurerm_windows_virtual_machine.n01579649-vmwindows[*].private_ip_address
}

output "n01579649-vmwindows-public-ip" {
    value = azurerm_windows_virtual_machine.n01579649-vmwindows[*].public_ip_address
}