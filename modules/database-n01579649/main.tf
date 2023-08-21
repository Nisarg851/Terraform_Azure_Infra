#psql creation
resource "azurerm_postgresql_server" "n01579649-database-server" {  
  resource_group_name = var.rg-info.name
  location            = var.rg-info.location

  name                = "${var.n01579649-database-info.name}-server"

  sku_name = var.n01579649-database-server-info.sku_name

  storage_mb                   = var.n01579649-database-server-info.storage_mb
  backup_retention_days        = var.n01579649-database-server-info.backup_retention_days
  geo_redundant_backup_enabled = var.n01579649-database-server-info.geo_redundant_backup_enabled
  auto_grow_enabled            = var.n01579649-database-server-info.auto_grow_enabled

  administrator_login          = var.n01579649-database-server-info.administrator_login
  administrator_login_password = var.n01579649-database-server-info.administrator_login_password
  version                      = var.n01579649-database-server-info.version
  ssl_enforcement_enabled      = var.n01579649-database-server-info.ssl_enforcement_enabled
}

resource "azurerm_postgresql_database" "n01579649-database" {  
  resource_group_name = var.rg-info.name

  name                = var.n01579649-database-info.name
  server_name         = azurerm_postgresql_server.n01579649-database-server.name

  charset             = var.n01579649-database-info.charset
  collation           = var.n01579649-database-info.collation
}