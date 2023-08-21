resource "azurerm_availability_set" "n01579649-vmwindows-avs" {
    resource_group_name = var.rg-info.name
    location = var.rg-info.location

    count = var.instance_count

    name = "${var.n01579649-vmwindows-info.name}-avs-${format("%d", count.index+1)}"

    platform_update_domain_count = var.n01579649-vmwindows-avs-info.platform_update_domain_count
    platform_fault_domain_count = var.n01579649-vmwindows-avs-info.platform_fault_domain_count

    tags = var.tags
}

resource "azurerm_public_ip" "n01579649-vmwindows-pip" {
    resource_group_name = var.rg-info.name
    location = var.rg-info.location

    count = var.instance_count

    name = "${var.n01579649-vmwindows-info.name}-pip-${format("%d", count.index+1)}"
    allocation_method = var.n01579649-vmwindows-pip.allocation_method
    domain_name_label = "${var.n01579649-vmwindows-info.name}${format("%d", count.index+1)}"

    idle_timeout_in_minutes = var.n01579649-vmwindows-pip.idle_timeout_in_minutes

    tags = var.tags
}

resource "azurerm_network_interface" "n01579649-vmwindows-nic" {
    resource_group_name = var.rg-info.name
    location = var.rg-info.location

    count = var.instance_count

    name = "${var.n01579649-vmwindows-info.name}-nic-${format("%d", count.index+1)}"

    ip_configuration {
      name = "${var.n01579649-vmwindows-info.name}-ipconfig-${format("%d", count.index+1)}"
      subnet_id = var.n01579649-vmwindows-nic.ip_configuration.subnet_id
      private_ip_address_allocation = var.n01579649-vmwindows-nic.ip_configuration.private_ip_address_allocation
      public_ip_address_id = azurerm_public_ip.n01579649-vmwindows-pip[count.index].id
    }

    tags = var.tags
}

resource "azurerm_windows_virtual_machine" "n01579649-vmwindows" {
    resource_group_name = var.rg-info.name
    location = var.rg-info.location

    count = var.instance_count

    name = "${var.n01579649-vmwindows-info.name}-${format("%d", count.index+1)}"
    computer_name = "win-${var.n01579649-vmwindows-info.computer_name}"
    size = var.n01579649-vmwindows-info.size
    admin_username = var.n01579649-vmwindows-info.admin_username
    admin_password = var.n01579649-vmwindows-info.admin_password

    winrm_listener {
      protocol = var.n01579649-vmwindows-info.winrm_listener_protocol
    }

    os_disk {
      name = "${var.n01579649-vmwindows-info.name}-osdisk-${format("%d", count.index+1)}"
      storage_account_type = var.n01579649-vmwindows-info.os_disk.storage_account_type
      disk_size_gb = var.n01579649-vmwindows-info.os_disk.disk_size_gb
      caching = var.n01579649-vmwindows-info.os_disk.caching
    }

    source_image_reference {
      publisher = var.n01579649-vmwindows-info.source_image_reference.publisher
      offer = var.n01579649-vmwindows-info.source_image_reference.offer
      sku = var.n01579649-vmwindows-info.source_image_reference.sku
      version = var.n01579649-vmwindows-info.source_image_reference.version
    }

    boot_diagnostics {
      storage_account_uri = var.n01579649-vmwindows-info.storage_account_uri
    }

    network_interface_ids = [azurerm_network_interface.n01579649-vmwindows-nic[count.index].id]

    depends_on = [ azurerm_availability_set.n01579649-vmwindows-avs ]

    tags = var.tags
}

resource "azurerm_virtual_machine_extension" "n01579649-vmwindows-antimalware" {

    count = var.instance_count

  name = "${var.n01579649-vmwindows-info.name}-antimalware-${format("%d", count.index+1)}"
  publisher = var.n01579649-vmwindows-antimalware.publisher
  type = var.n01579649-vmwindows-antimalware.type
  type_handler_version = var.n01579649-vmwindows-antimalware.type_handler_version
  auto_upgrade_minor_version = var.n01579649-vmwindows-antimalware.auto_upgrade_minor_version
  virtual_machine_id = element(azurerm_windows_virtual_machine.n01579649-vmwindows[*].id, count.index)

  settings = <<SETTINGS
        {
            "AntimalwareEnabled": true,
            "RealtimeProtectionEnabled": "true",
            "ScheduledScanSettings": {
                "isEnabled": "true",
                "day": "1",
                "time": "120",
                "scanType": "Quick"
                },
            "Exclusions": {
                "Extensions": "",
                "Paths": "",
                "Processes": ""
                }
        }
    SETTINGS

    tags = var.tags
}