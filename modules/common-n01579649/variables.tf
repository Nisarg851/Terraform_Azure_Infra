variable "tags" {
    type = map(string)
    description = "Contains local tags"  
}

variable "rg-info" {
    type = map(string)
    description = "Contains information about the resource group information"  
}

variable "log_analytics_workspace-info" {
    type = map(string)
    description = "Contians information about the log analytics workspace"
}

variable "recovery_services_vault-info" {
    type = map(string)
    description = "Contains information about the recovery vault"
}

variable "storage_account-info" {
    type = map(string)
    description = "Contains information about the storage account"
}