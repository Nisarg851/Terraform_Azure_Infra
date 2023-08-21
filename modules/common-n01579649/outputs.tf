output "log_analytics_workspace-name" {
    value = azurerm_log_analytics_workspace.n01579649-log_analytics_workspace.name
}

output "recovery_services_vault-name" {
    value = azurerm_recovery_services_vault.n01579649-recovery_services_vault.name
}

output "storage_account-name" {
  value = azurerm_storage_account.storage_account.name
}

output "storage_account-primary_blob_endpoint" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}