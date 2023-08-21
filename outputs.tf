# Resource group
output "rg-n01579649-name" {
  value = module.rgroup-n01579649.rg-n01579649-info.name
}

# Network resources
output "n01579649-VNET-name" {
  value = module.network-n01579649.n01579649-VNET-name
}

output "n01579649-SUBNET" {
  value = module.network-n01579649.n01579649-SUBNET
}

# Common resources
output "log_analytics_workspace-name" {
  value = module.common-n01579649.log_analytics_workspace-name
}

output "recovery_services_vault-name" {
  value = module.common-n01579649.recovery_services_vault-name
}

output "storage_account-name" {
  value = module.common-n01579649.storage_account-name
}

# Virtual Machine: Linux resources
output "n01579649-vmlinux-hostname" {
  value = module.vmlinux-n01579649.n01579649-vmlinux
}

output "n01579649-vmlinux-FQDN" {
  value = module.vmlinux-n01579649.n01579649-vmlinux-FQDN
}

output "n01579649-vmlinux-private-ip" {
  value = module.vmlinux-n01579649.n01579649-vmlinux-private-ip
}

output "n01579649-vmlinux-public-ip" {
  value = module.vmlinux-n01579649.n01579649-vmlinux-public-ip
}

# Virtual Machine: Windows resources
output "n01579649-vmwindows-hostname" {
  value = module.vmwindows-n01579649.n01579649-vmwindows
}

output "n01579649-vmwindows-FQDN" {
  value = module.vmwindows-n01579649.n01579649-vmwindows-FQDN
}

output "n01579649-vmwindows-private-ip" {
  value = module.vmwindows-n01579649.n01579649-vmwindows-private-ip
}

output "n01579649-vmwindows-public-ip" {
  value = module.vmwindows-n01579649.n01579649-vmwindows-public-ip
}

# loadbalancer
output "n01579649-loadbalancer-name" {
  value = module.loadbalancer-n01579649.n01579649-loadbalancer-name
}

output "n01579649-loadbalancer-fqdn" {
    value = module.loadbalancer-n01579649.n01579649-loadbalancer-fqdn
}

# Database
output "n01579649-database" {
  value = module.database-n01579649.n01579649-database-name
}