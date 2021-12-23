locals {
  tmp_dir     = "${path.cwd}/.tmp"
  name_prefix = var.name_prefix != "" ? var.name_prefix : var.resource_group_name
  name        = var.name != "" ? var.name : "${replace(local.name_prefix, "/[^a-zA-Z0-9_\\-\\.]/", "")}-${var.label}"
}
resource null_resource print_names {
  provisioner "local-exec" {
    command = "echo 'Resource group: ${var.resource_group_name}'"
  }
}

data "ibm_resource_group" "tools_resource_group" {
  depends_on = [null_resource.print_names]

  name = var.resource_group_name
}

resource "ibm_cis" "cis_instance" {
  count             = var.provision ? 1 : 0
  name              = local.name
  plan              = var.plan
  resource_group_id = data.ibm_resource_group.tools_resource_group.id
  tags              = setsubtract(var.tags, [""])
  location          = "global"

  //User can increase timeouts
  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}
