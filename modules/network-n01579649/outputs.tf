output "n01579649-VNET-name" {
    value = azurerm_virtual_network.n01579649-VNET.name
}

output "n01579649-SUBNET" {
    value = {
        id = azurerm_subnet.n01579649-SUBNET.id
        name = azurerm_subnet.n01579649-SUBNET.name
    }
}