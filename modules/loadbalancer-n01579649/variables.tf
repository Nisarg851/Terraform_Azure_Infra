variable "tags" {
    type = map(string)
    description = "Contains local tags"  
}

variable "rg-info" {
    type = map(string)
    description = "Contains information about the resource group i.e name and location"
}

variable "n01579649-loadbalancer-name" {
    type = string
    description = "Name of the load balancer"
}

variable "allocation_method" {
    type = string
    description = "Allocation method for the public IP address"
}

variable "n01579649-loadbalancer-nic-backend_pool_association-info" {
    type = any
    description = "Contains information about the NIC and load balancer's backend_pool association"
}

variable "n01579649-loadbalancer-rules" {
  type = map(string)
  description = "Contains information about the firewall rules for load balancer"
}