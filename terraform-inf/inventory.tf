# dynamically create a ansible inventory

resource "local_file" "ansible_staging_inventory" {
  content = templatefile("inventory.tmpl", {
    BastionIP = aws_instance.Bastion.public_ip
    Vaultip   = aws_instance.Vaultserver.public_ip
    DBip      = aws_instance.DBserver.private_ip
  })
  filename = format("%s/%s", abspath(path.root), "../ansible-deployment/inventory_staging")
}
