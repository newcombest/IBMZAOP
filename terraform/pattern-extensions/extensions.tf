# VPC Load Balancer - mgmt	
locals {	
  mgmt_lb_name = replace("${module.management_vpc.name}-lb", "/[^a-zA-Z0-9_\\-\\.]/", "")	
}	

data ibm_is_security_group mgmt_vpc_default_sg {
  depends_on = [ module.management_vpc ]  
  name = "${module.management_vpc.name}-default"  
}



module "mgmt_load_balancer" {
  source = "github.com/slzone/terraform-ibm-load-balancer?ref=ibm-cloud-load-balancer"

  load_balancer_provision = var.mgmt_load_balancer_provision
  name                    = var.mgmt_load_balancer_name
  subnets                 = module.mgmt_subnets.subnets.*.id
  ibmcloud_api_key        = var.ibmcloud_api_key
  resource_group_id       = module.mgmt_resource_group.id
  security_groups         = data.ibm_is_security_group.mgmt_vpc_default_sg.id != null ? [ data.ibm_is_security_group.mgmt_vpc_default_sg.id ] : []
  type                    = var.type
  tags                    = var.lb_tags
  region                  = var.region
}

# VPC Load Balancer - workload	
locals {	
  workload_lb_name = replace("${module.workload_vpc.name}-lb", "/[^a-zA-Z0-9_\\-\\.]/", "")	
}	

data ibm_is_security_group workload_vpc_default_sg {  
  depends_on = [ module.workload_vpc ]
  name = "${module.workload_vpc.name}-default"  
}
data ibm_is_security_group workload2_vpc_default_sg {  
  depends_on = [ module.workload2_vpc ]
  name = "${module.workload2_vpc.name}-default"  
}
data ibm_is_security_group workload3_vpc_default_sg {  
  depends_on = [ module.workload3_vpc ]
  name = "${module.workload3_vpc.name}-default"  
}


module "workload_load_balancer" {
  source = "github.com/slzone/terraform-ibm-load-balancer?ref=ibm-cloud-load-balancer"

  load_balancer_provision = var.workload_load_balancer_provision
  name                    = var.workload_load_balancer_name
  subnets                 = module.workload_subnets.subnets.*.id
  ibmcloud_api_key        = var.ibmcloud_api_key
  resource_group_id       = module.workload_resource_group.id
  security_groups         = data.ibm_is_security_group.workload_vpc_default_sg.id != null ? [ data.ibm_is_security_group.workload_vpc_default_sg.id ] : []
  type                    = var.type
  tags                    = var.lb_tags
  region                  = var.region
}
module "workload2_load_balancer" {
  source = "github.com/slzone/terraform-ibm-load-balancer?ref=ibm-cloud-load-balancer"

  load_balancer_provision = var.workload2_load_balancer_provision
  name                    = var.workload2_load_balancer_name
  subnets                 = module.workload2_subnets.subnets.*.id
  ibmcloud_api_key        = var.ibmcloud_api_key
  resource_group_id       = module.workload2_resource_group.id
  security_groups         = data.ibm_is_security_group.workload2_vpc_default_sg.id != null ? [ data.ibm_is_security_group.workload2_vpc_default_sg.id ] : []
  type                    = var.type
  tags                    = var.lb_tags
  region                  = var.region
}
module "workload3_load_balancer" {
  source = "github.com/slzone/terraform-ibm-load-balancer?ref=ibm-cloud-load-balancer"

  load_balancer_provision = var.workload3_load_balancer_provision
  name                    = var.workload3_load_balancer_name
  subnets                 = module.workload3_subnets.subnets.*.id
  ibmcloud_api_key        = var.ibmcloud_api_key
  resource_group_id       = module.workload3_resource_group.id
  security_groups         = data.ibm_is_security_group.workload3_vpc_default_sg.id != null ? [ data.ibm_is_security_group.workload3_vpc_default_sg.id ] : []
  type                    = var.type
  tags                    = var.lb_tags
  region                  = var.region
}

module "appid" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-appid?ref=v1.3.0"

  resource_group_name = module.cs_resource_group.name
  resource_location   = var.region
  tags                = var.appid_tags == null ? null : jsondecode(var.appid_tags)
  name_prefix         = var.appid_name_prefix
  plan                = var.appid_plan
  ibmcloud_api_key    = var.ibmcloud_api_key
}
