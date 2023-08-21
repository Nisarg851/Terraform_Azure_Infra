resource "azurerm_resource_group" "n01579649-RG" {
    name = var.rg-n01579649-info.name
    location = var.rg-n01579649-info.location
    tags = var.tags
}