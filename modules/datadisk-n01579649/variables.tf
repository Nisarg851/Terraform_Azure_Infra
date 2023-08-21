variable "tags" {
    type = map(string)
    description = "Contains local tags"  
}

variable "rg-info" {
    type = map(string)
    description = "Contains information about the resource group for linux machine"
}

variable "n01579649-vmlinux-datadisk-info" {
    type = any
    description = "Contians information about the datadisk for Linux VMs"
}

variable "n01579649-vmlinux-datadisk-attachment-info" {
    type = any
    description = "Contians information about attachment configurations for Linux VMs and their respective datadisks"
}

variable "n01579649-vmwindows-datadisk-info" {
    type = any
    description = "Contians information about the datadisk for Windows VMs"
}

variable "n01579649-vmwindows-datadisk-attachment-info" {
    type = any
    description = "Contians information about attachment configurations for Windows VMs and their respective datadisks"
}