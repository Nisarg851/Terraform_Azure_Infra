resource "azurerm_log_analytics_workspace" "n01579649-log_analytics_workspace" {
    name = var.log_analytics_workspace-info.name
    resource_group_name = var.rg-info.name
    location = var.rg-info.location
    sku = var.log_analytics_workspace-info.sku
    retention_in_days = var.log_analytics_workspace-info.retention_in_days

    tags = var.tags
}

resource "azurerm_recovery_services_vault" "n01579649-recovery_services_vault" {
    name = var.recovery_services_vault-info.name
    resource_group_name = var.rg-info.name
    location = var.rg-info.location
    sku = var.recovery_services_vault-info.sku
    soft_delete_enabled = var.recovery_services_vault-info.soft_delete_mode

    tags = var.tags
}

resource "azurerm_storage_account" "storage_account" {
    name = var.storage_account-info.name
    resource_group_name = var.rg-info.name
    location = var.rg-info.location
    account_tier = var.storage_account-info.account_tier
    account_replication_type = var.storage_account-info.account_replication_type

    tags = var.tags
}