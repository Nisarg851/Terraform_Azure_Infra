variable "tags" {
    type = map(string)
    description = "Contains local tags"  
}

variable "rg-info" {
    type = map(string)
    description = "Contains information about the resource group for linux machine"
}

variable "instance_count" {
    type = number
    description = "Total number of Linux VMs" 
}

variable "n01579649-vmlinux-info" {
    type = any
    description = "Contians information about the VM linux instances"
}

variable "n01579649-vmlinux-avs-info" {
    type = map(string)
    description = "Contains information about the availability set of linux VMs"
}

variable "n01579649-vmlinux-nic" {
    type = any
    description = "Contians information about the Network interface of linux VMs"
}

variable "n01579649-vmlinux-pip" {
    type = map(string)
    description = "Contians information about the public ip of linux VMs"
}

variable "n01579649-vmlinux-network-watcher" {
    type = any
    description = "Contains information about the Network watcher"
}

variable "n01579649-vmlinux-network-monitor" {
    type = any
    description = "Contains information about the Network monitor"
}