locals {
  instances = {
    for instance in range(1, "${var.instance_count}"+1) :
        "${instance}" => "vmlinux-${instance}"
  }
}

resource "azurerm_availability_set" "n01579649-vmlinux-avs" {
    resource_group_name   = var.rg-info.name
    location              = var.rg-info.location

    # for_each              = local.instances

    name = "${var.n01579649-vmlinux-info.name}-avs"

    platform_fault_domain_count = var.n01579649-vmlinux-avs-info.platform_fault_domain_count
    platform_update_domain_count = var.n01579649-vmlinux-avs-info.platform_update_domain_count

    tags = var.tags
}

resource "azurerm_public_ip" "n01579649-pip" {
    resource_group_name   = var.rg-info.name
    location              = var.rg-info.location

    for_each              = local.instances

    name = "${var.n01579649-vmlinux-info.name}-pip-${each.key}"

    allocation_method = var.n01579649-vmlinux-pip.allocation_method

    domain_name_label = "${var.n01579649-vmlinux-info.name}${each.key}"

    idle_timeout_in_minutes = var.n01579649-vmlinux-pip.idle_timeout_in_minutes

    tags = var.tags
}

resource "azurerm_network_interface" "n01579649-nic" {
    resource_group_name   = var.rg-info.name
    location              = var.rg-info.location

    for_each              = local.instances

    name = "${var.n01579649-vmlinux-info.name}-nic-${each.key}"

    ip_configuration {
      name = "${var.n01579649-vmlinux-info.name}-ipconfig-${each.key}"
      subnet_id = "${var.n01579649-vmlinux-nic.ip_configuration.subnet_id}"
      private_ip_address_allocation = "${var.n01579649-vmlinux-nic.ip_configuration.private_ip_address_allocation}"
      public_ip_address_id = azurerm_public_ip.n01579649-pip[each.key].id
    }

    tags = var.tags
}

resource "azurerm_linux_virtual_machine" "n01579649-vmlinux" {
  resource_group_name   = var.rg-info.name
  location              = var.rg-info.location

  for_each              = local.instances

  name                  = "${var.n01579649-vmlinux-info.name}-${each.key}"

  computer_name  = "${each.value}"
  size = var.n01579649-vmlinux-info.size
  admin_username = var.n01579649-vmlinux-info.admin_ssh_key.admin_username
  
  admin_ssh_key {
    username = var.n01579649-vmlinux-info.admin_ssh_key.admin_username
    public_key = file(var.n01579649-vmlinux-info.admin_ssh_key.public_key)
  }


  availability_set_id   = azurerm_availability_set.n01579649-vmlinux-avs.id
  
  network_interface_ids = [azurerm_network_interface.n01579649-nic[each.key].id]

  source_image_reference {
    publisher = var.n01579649-vmlinux-info.source_image_reference.publisher
    offer     = var.n01579649-vmlinux-info.source_image_reference.offer
    sku       = var.n01579649-vmlinux-info.source_image_reference.sku
    version   = var.n01579649-vmlinux-info.source_image_reference.version
  }

  os_disk {
    name              = "${var.n01579649-vmlinux-info.name}-osdisk-${each.key}"
    storage_account_type = var.n01579649-vmlinux-info.os_disk.storage_account_type
    disk_size_gb = var.n01579649-vmlinux-info.os_disk.disk_size_gb
    caching           = var.n01579649-vmlinux-info.os_disk.caching
  }

  boot_diagnostics {
    storage_account_uri = var.n01579649-vmlinux-info.storage_account_uri
  }

    depends_on = [ azurerm_availability_set.n01579649-vmlinux-avs ]

    tags = var.tags
}

resource "azurerm_virtual_machine_extension" "n01579649-vmlinux-network-watcher" {
    for_each              = local.instances

    name = "${var.n01579649-vmlinux-info.name}-network-watcher-${each.key}"
    virtual_machine_id = azurerm_linux_virtual_machine.n01579649-vmlinux[each.key].id

    publisher = var.n01579649-vmlinux-network-watcher.publisher
    type = var.n01579649-vmlinux-network-watcher.type
    type_handler_version = var.n01579649-vmlinux-network-watcher.type_handler_version
    auto_upgrade_minor_version = var.n01579649-vmlinux-network-watcher.auto_upgrade_minor_version

    settings = var.n01579649-vmlinux-network-watcher.settings

    tags = var.tags
}

resource "azurerm_virtual_machine_extension" "n01579649-vmlinux-network-monitor" {
  for_each                = local.instances

  name                    = "${var.n01579649-vmlinux-info.name}-azuremonitor-${each.key}"
  virtual_machine_id      = azurerm_linux_virtual_machine.n01579649-vmlinux[each.key].id

  publisher               = var.n01579649-vmlinux-network-monitor.publisher
  type                    = var.n01579649-vmlinux-network-monitor.type
  type_handler_version    = var.n01579649-vmlinux-network-monitor.type_handler_version
  auto_upgrade_minor_version = var.n01579649-vmlinux-network-monitor.auto_upgrade_minor_version

  settings = var.n01579649-vmlinux-network-monitor.settings

  tags = var.tags
}
