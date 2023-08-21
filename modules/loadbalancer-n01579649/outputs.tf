output "n01579649-loadbalancer-name" {
    value = azurerm_lb.n01579649-loadbalancer.name
}

output "n01579649-loadbalancer-fqdn" {
    value = azurerm_public_ip.n01579649-loadbalancer-pip.fqdn
}