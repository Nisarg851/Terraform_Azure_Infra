resource "null_resource" "vmlinux-n01579649-provisioner-linux" {
    for_each = local.instances

    # provisioner "remote-exec" {
    #     inline = [ "echo Hostname: $(hostname)" ]
    # }

    provisioner "local-exec" {
      command = "ansible-playbook -i '/mnt/c/Users/Nisarg Mahyavanshi/automation/terraform/assignment1-n01579649/ansible/hosts' '/mnt/c/Users/Nisarg Mahyavanshi/automation/terraform/assignment1-n01579649/ansible/n01579649-playbook.yaml'"
    }

    connection {
      type = "ssh"
      user = var.n01579649-vmlinux-info.admin_ssh_key.admin_username
      host = azurerm_linux_virtual_machine.n01579649-vmlinux[each.key].public_ip_address
      private_key = file(var.n01579649-vmlinux-info.private_key)
    }

    depends_on = [ azurerm_linux_virtual_machine.n01579649-vmlinux ]
}