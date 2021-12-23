module "cs_resource_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-resource-group?ref=v2.3.0"

  resource_group_name = var.cs_resource_group_name
  ibmcloud_api_key    = var.ibmcloud_api_key
  provision           = var.cs_resource_group_provision
}

module "kms_resource_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-resource-group?ref=v2.3.0"

  resource_group_name = var.kms_resource_group_name
  ibmcloud_api_key    = var.ibmcloud_api_key
  provision           = var.kms_resource_group_provision
}

module "mgmt_resource_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-resource-group?ref=v2.3.0"

  resource_group_name = var.mgmt_resource_group_name
  ibmcloud_api_key    = var.ibmcloud_api_key
  provision           = var.mgmt_resource_group_provision
}

module "workload_resource_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-resource-group?ref=v2.3.0"

  resource_group_name = var.workload_resource_group_name
  ibmcloud_api_key    = var.ibmcloud_api_key
  provision           = var.workload_resource_group_provision
}
module "workload2_resource_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-resource-group?ref=v2.3.0"

  resource_group_name = var.workload2_resource_group_name
  ibmcloud_api_key    = var.ibmcloud_api_key
  provision           = var.workload2_resource_group_provision
}
module "workload3_resource_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-resource-group?ref=v2.3.0"

  resource_group_name = var.workload3_resource_group_name
  ibmcloud_api_key    = var.ibmcloud_api_key
  provision           = var.workload3_resource_group_provision
}

module "kms" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-kms?ref=v0.2.0"

  resource_group_name = module.kms_resource_group.name
  region = var.kms_region
  name_prefix = var.kms_name_prefix
  name = var.kms_name
  ibmcloud_api_key = var.ibmcloud_api_key
  private_endpoint = var.kms_private_endpoint
  tags = var.kms_tags == null ? null : jsondecode(var.kms_tags)
  provision = var.kms_provision
  number_of_crypto_units = var.kms_number_of_crypto_units
  service = var.kms_service
}

## Enable this only if want HPCS inititalization automated
# Initialize the HPCS instance
 # module "hpcs_init" {
# initialize = var.hpcs_initialize
#  source     = "github.com/slzone/terraform-ibm-hpcs-initialization"

#  hpcs_instance_guid  = module.hpcs.guid
#  tke_files_path      = var.tke_files_path
#  admin1_name         = var.admin1_name
#  admin1_password     = var.admin1_password
#  admin2_name         = var.admin2_name
#  admin2_password     = var.admin2_password
#  admin_num           = var.admin_num
#  threshold_value     = var.threshold_value
#  rev_threshold_value = var.rev_threshold_value
#}

# Upload signed keys / tke files to provided COS bucket
# module "upload_to_cos" {
#  source = "github.com/slzone/terraform-ibm-cos-upload"

#  count = (var.hpcs_initialize ? 1 : 0)

#  depends_on         = [module.hpcs_init]
#  api_key            = var.ibmcloud_api_key
#  cos_crn            = var.cos_crn
#  endpoint           = var.endpoint
#  bucket_name        = var.bucket_name
#  path               = var.tke_files_path
#  hpcs_instance_guid = module.hpcs.guid
#}

# Remove tke files from local path
# module "remove_tke_files" {
#  source = "github.com/slzone/terraform-ibm-tke-delete-local-keys"

#  count = (var.hpcs_initialize ? 1 : 0)

#  depends_on         = [module.upload_to_cos]
#  tke_files_path     = var.tke_files_path
#  hpcs_instance_guid = module.hpcs.guid
#}

# Apply HPCS Network and dual auth delete policies
#module "hpcs_policies" {
#  source = "github.com/slzone/terraform-ibm-hpcs-policies"

#  count = (var.hpcs_initialize ? 1 : 0)

#  depends_on           = [module.hpcs_init]
#  region               = var.region
#  resource_group_name  = module.hpcs_resource_group.name
#  hpcs_instance_guid   = module.hpcs.guid
#  allowed_network_type = var.allowed_network_type
#  hpcs_port            = var.hpcs_port
#  dual_auth_delete     = var.dual_auth_delete
#}
## END - HPCS inititalization automated

module "ibm_access_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-access-group?ref=v2.2.0"

  resource_group_name = module.cs_resource_group.name
  provision           = module.cs_resource_group.provision
}

module "mgmt_access_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-access-group?ref=v2.2.0"

  resource_group_name = module.mgmt_resource_group.name
  provision           = module.mgmt_resource_group.provision
}

module "workload_access_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-access-group?ref=v2.2.0"

  resource_group_name = module.workload_resource_group.name
  provision           = module.workload_resource_group.provision
}
module "workload2_access_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-access-group?ref=v2.2.0"

  resource_group_name = module.workload2_resource_group.name
  provision           = module.workload2_resource_group.provision
}
module "workload3_access_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-access-group?ref=v2.2.0"

  resource_group_name = module.workload3_resource_group.name
  provision           = module.workload3_resource_group.provision
}

module "mgmt_kms_key" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-kms-key?ref=v1.2.0"

  kms_id            = module.kms.guid
  region            = module.kms.location
  ibmcloud_api_key  = var.ibmcloud_api_key
  name_prefix       = var.mgmt_name_prefix
  provision         = var.mgmt_kms_key_provision
  name              = var.mgmt_kms_key_name
  label             = var.mgmt_kms_key_label
  rotation_interval = var.mgmt_kms_key_rotation_interval
  dual_auth_delete  = var.mgmt_kms_key_dual_auth_delete
}

module "workload_kms_key" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-kms-key?ref=v1.2.0"

  kms_id            = module.kms.guid
  region            = module.kms.location
  ibmcloud_api_key  = var.ibmcloud_api_key
  name_prefix       = var.workload_name_prefix
  provision         = var.workload_kms_key_provision
  name              = var.workload_kms_key_name
  label             = var.workload_kms_key_label
  rotation_interval = var.workload_kms_key_rotation_interval
  dual_auth_delete  = var.workload_kms_key_dual_auth_delete
}
module "workload2_kms_key" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-kms-key?ref=v1.2.0"

  kms_id            = module.kms.guid
  region            = module.kms.location
  ibmcloud_api_key  = var.ibmcloud_api_key
  name_prefix       = var.workload2_name_prefix
  provision         = var.workload2_kms_key_provision
  name              = var.workload2_kms_key_name
  label             = var.workload2_kms_key_label
  rotation_interval = var.workload2_kms_key_rotation_interval
  dual_auth_delete  = var.workload2_kms_key_dual_auth_delete
}
module "workload3_kms_key" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-kms-key?ref=v1.2.0"

  kms_id            = module.kms.guid
  region            = module.kms.location
  ibmcloud_api_key  = var.ibmcloud_api_key
  name_prefix       = var.workload3_name_prefix
  provision         = var.workload3_kms_key_provision
  name              = var.workload3_kms_key_name
  label             = var.workload3_kms_key_label
  rotation_interval = var.workload3_kms_key_rotation_interval
  dual_auth_delete  = var.workload3_kms_key_dual_auth_delete
}
module "mgmt_cos" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-object-storage?ref=v3.2.0"

  resource_group_name = module.mgmt_resource_group.name
  name_prefix         = var.mgmt_name_prefix
  resource_location   = var.mgmt_cos_resource_location
  tags                = var.mgmt_cos_tags == null ? null : jsondecode(var.mgmt_cos_tags)
  plan                = var.mgmt_cos_plan
  provision           = var.mgmt_cos_provision
  label               = var.mgmt_cos_label
}

module "workload_cos" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-object-storage?ref=v3.2.0"

  resource_group_name = module.workload_resource_group.name
  name_prefix         = var.workload_name_prefix
  resource_location   = var.workload_cos_resource_location
  tags                = var.workload_cos_tags == null ? null : jsondecode(var.workload_cos_tags)
  plan                = var.workload_cos_plan
  provision           = var.workload_cos_provision
  label               = var.workload_cos_label
}
module "workload2_cos" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-object-storage?ref=v3.2.0"

  resource_group_name = module.workload2_resource_group.name
  name_prefix         = var.workload2_name_prefix
  resource_location   = var.workload2_cos_resource_location
  tags                = var.workload2_cos_tags == null ? null : jsondecode(var.workload2_cos_tags)
  plan                = var.workload2_cos_plan
  provision           = var.workload2_cos_provision
  label               = var.workload2_cos_label
}
module "workload3_cos" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-object-storage?ref=v3.2.0"

  resource_group_name = module.workload3_resource_group.name
  name_prefix         = var.workload3_name_prefix
  resource_location   = var.workload3_cos_resource_location
  tags                = var.workload3_cos_tags == null ? null : jsondecode(var.workload3_cos_tags)
  plan                = var.workload3_cos_plan
  provision           = var.workload3_cos_provision
  label               = var.workload3_cos_label
}

module "mgmt_cos_auth" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-iam-service-authorization?ref=v1.1.2"

  source_service_name         = var.mgmt_cos_auth_source_service_name
  source_resource_instance_id = var.mgmt_cos_auth_source_resource_instance_id
  source_resource_type        = var.mgmt_cos_auth_source_resource_type
  source_resource_group_id    = var.mgmt_cos_auth_source_resource_group_id
  provision                   = var.mgmt_cos_auth_provision
  target_service_name         = var.kms_service == "hpcs" ? "hs-crypto" : "kms"
  target_resource_instance_id = var.mgmt_cos_auth_target_resource_instance_id
  target_resource_type        = var.mgmt_cos_auth_target_resource_type
  target_resource_group_id    = module.kms_resource_group.id
  roles                       = var.mgmt_cos_auth_roles == null ? null : jsondecode(var.mgmt_cos_auth_roles)
  source_service_account      = var.mgmt_cos_auth_source_service_account
}

## Enable this only if management and workload resource groups are separate
#module "workload_cos_auth" {
#  source = "github.com/cloud-native-toolkit/terraform-ibm-iam-service-authorization?ref=v1.1.2"
#
#  source_service_name         = var.workload_cos_auth_source_service_name
#  source_resource_instance_id = var.workload_cos_auth_source_resource_instance_id
#  source_resource_type        = var.workload_cos_auth_source_resource_type
#  source_resource_group_id    = var.workload_cos_auth_source_resource_group_id
#  provision                   = var.workload_cos_auth_provision
#  target_service_name         = var.kms_service == "hpcs" ? "hs-crypto" : "kms"
#  target_resource_instance_id = var.workload_cos_auth_target_resource_instance_id
#  target_resource_type        = var.workload_cos_auth_target_resource_type
#  target_resource_group_id    = module.kms_resource_group.id
#  roles                       = var.workload_cos_auth_roles == null ? null : jsondecode(var.workload_cos_auth_roles)
#  source_service_account      = var.workload_cos_auth_source_service_account
#}

module "mgmt_flow_log_auth" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-iam-service-authorization?ref=v1.1.2"

  source_service_name         = var.mgmt_flow_log_auth_source_service_name
  source_resource_instance_id = var.mgmt_flow_log_auth_source_resource_instance_id
  source_resource_type        = var.mgmt_flow_log_auth_source_resource_type
  source_resource_group_id    = var.mgmt_flow_log_auth_source_resource_group_id
  provision                   = var.mgmt_flow_log_auth_provision
  target_service_name         = var.mgmt_flow_log_auth_target_service_name
  target_resource_instance_id = var.mgmt_flow_log_auth_target_resource_instance_id
  target_resource_type        = var.mgmt_flow_log_auth_target_resource_type
  target_resource_group_id    = module.mgmt_resource_group.id
  roles                       = var.mgmt_flow_log_auth_roles == null ? null : jsondecode(var.mgmt_flow_log_auth_roles)
  source_service_account      = var.mgmt_flow_log_auth_source_service_account
}
module "workload_flow_log_auth" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-iam-service-authorization?ref=v1.1.2"

  source_service_name         = var.workload_flow_log_auth_source_service_name
  source_resource_instance_id = var.workload_flow_log_auth_source_resource_instance_id
  source_resource_type        = var.workload_flow_log_auth_source_resource_type
  source_resource_group_id    = var.workload_flow_log_auth_source_resource_group_id
  provision                   = var.workload_flow_log_auth_provision
  target_service_name         = var.workload_flow_log_auth_target_service_name
  target_resource_instance_id = var.workload_flow_log_auth_target_resource_instance_id
  target_resource_type        = var.workload_flow_log_auth_target_resource_type
  target_resource_group_id    = module.workload_resource_group.id
  roles                       = var.mgmt_flow_log_auth_roles == null ? null : jsondecode(var.workload_flow_log_auth_roles)
  source_service_account      = var.workload_flow_log_auth_source_service_account
}
module "workload2_flow_log_auth" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-iam-service-authorization?ref=v1.1.2"

  source_service_name         = var.workload2_flow_log_auth_source_service_name
  source_resource_instance_id = var.workload2_flow_log_auth_source_resource_instance_id
  source_resource_type        = var.workload2_flow_log_auth_source_resource_type
  source_resource_group_id    = var.workload2_flow_log_auth_source_resource_group_id
  provision                   = var.workload2_flow_log_auth_provision
  target_service_name         = var.workload2_flow_log_auth_target_service_name
  target_resource_instance_id = var.workload2_flow_log_auth_target_resource_instance_id
  target_resource_type        = var.workload2_flow_log_auth_target_resource_type
  target_resource_group_id    = module.workload2_resource_group.id
  roles                       = var.mgmt_flow_log_auth_roles == null ? null : jsondecode(var.workload2_flow_log_auth_roles)
  source_service_account      = var.workload2_flow_log_auth_source_service_account
}
module "workload3_flow_log_auth" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-iam-service-authorization?ref=v1.1.2"

  source_service_name         = var.workload3_flow_log_auth_source_service_name
  source_resource_instance_id = var.workload3_flow_log_auth_source_resource_instance_id
  source_resource_type        = var.workload3_flow_log_auth_source_resource_type
  source_resource_group_id    = var.workload3_flow_log_auth_source_resource_group_id
  provision                   = var.workload3_flow_log_auth_provision
  target_service_name         = var.workload3_flow_log_auth_target_service_name
  target_resource_instance_id = var.workload3_flow_log_auth_target_resource_instance_id
  target_resource_type        = var.workload3_flow_log_auth_target_resource_type
  target_resource_group_id    = module.workload3_resource_group.id
  roles                       = var.mgmt_flow_log_auth_roles == null ? null : jsondecode(var.workload3_flow_log_auth_roles)
  source_service_account      = var.workload3_flow_log_auth_source_service_account
}
# module "mgmt_kube_encrypt_auth" {
#   source = "github.com/cloud-native-toolkit/terraform-ibm-iam-service-authorization?ref=v1.1.2"

#   source_service_name         = var.mgmt_kube_encrypt_auth_source_service_name
#   source_resource_instance_id = var.mgmt_kube_encrypt_auth_source_resource_instance_id
#   source_resource_type        = var.mgmt_kube_encrypt_auth_source_resource_type
#   source_resource_group_id    = module.mgmt_resource_group.id
#   provision                   = var.kube_encrypt_provision
#   target_service_name         = var.kms_service == "hpcs" ? "hs-crypto" : "kms"
#   target_resource_instance_id = var.mgmt_kube_encrypt_auth_target_resource_instance_id
#   target_resource_type        = var.mgmt_kube_encrypt_auth_target_resource_type
#   target_resource_group_id    = module.kms_resource_group.id
#   roles                       = var.mgmt_kube_encrypt_auth_roles == null ? null : jsondecode(var.mgmt_kube_encrypt_auth_roles)
#   source_service_account      = var.mgmt_kube_encrypt_auth_source_service_account
# }
## Enable this only if management and workload resource groups are separate
#module "workload_kube_encrypt_auth" {
#  source = "github.com/cloud-native-toolkit/terraform-ibm-iam-service-authorization?ref=v1.1.2"
#
#  source_service_name         = var.workload_kube_encrypt_auth_source_service_name
#  source_resource_instance_id = var.workload_kube_encrypt_auth_source_resource_instance_id
#  source_resource_type        = var.workload_kube_encrypt_auth_source_resource_type
#  source_resource_group_id    = module.workload_resource_group.id
#  provision                   = var.kube_encrypt_provision
#  target_service_name         = var.kms_service == "hpcs" ? "hs-crypto" : "kms"
#  target_resource_instance_id = var.workload_kube_encrypt_auth_target_resource_instance_id
#  target_resource_type        = var.workload_kube_encrypt_auth_target_resource_type
#  target_resource_group_id    = module.kms_resource_group.id
#  roles                       = var.workload_kube_encrypt_auth_roles == null ? null : jsondecode(var.workload_kube_encrypt_auth_roles)
#  source_service_account      = var.workload_kube_encrypt_auth_source_service_account
#}
module "mgmt_flow_log_bucket" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-object-storage-bucket?ref=v0.5.0"

  resource_group_name    = module.mgmt_resource_group.name
  cos_instance_id        = module.mgmt_cos.id
  kms_key_crn            = module.mgmt_kms_key.crn
  activity_tracker_crn   = var.mgmt_flow_log_bucket_activity_tracker_crn
  metrics_monitoring_crn = var.mgmt_flow_log_bucket_metrics_monitoring_crn
  vpc_ip_addresses       = module.management_vpc.addresses
  ibmcloud_api_key       = var.ibmcloud_api_key
  region                 = var.region
  name_prefix            = var.mgmt_name_prefix
  provision              = var.mgmt_flow_log_bucket_provision
  name                   = var.mgmt_flow_log_bucket_name
  label                  = var.mgmt_flow_log_bucket_label
  cross_region_location  = var.mgmt_flow_log_bucket_cross_region_location
  storage_class          = var.mgmt_flow_log_bucket_storage_class
  allowed_ip             = var.mgmt_flow_log_bucket_allowed_ip == null ? null : jsondecode(var.mgmt_flow_log_bucket_allowed_ip)
}

module "workload_flow_log_bucket" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-object-storage-bucket?ref=v0.5.0"

  resource_group_name    = module.workload_resource_group.name
  cos_instance_id        = module.workload_cos.id
  kms_key_crn            = module.workload_kms_key.crn
  activity_tracker_crn   = var.workload_flow_log_bucket_activity_tracker_crn
  metrics_monitoring_crn = var.workload_flow_log_bucket_metrics_monitoring_crn
  vpc_ip_addresses       = module.workload_vpc.addresses
  ibmcloud_api_key       = var.ibmcloud_api_key
  region                 = var.region
  name_prefix            = var.workload_name_prefix
  provision              = var.workload_flow_log_bucket_provision
  name                   = var.workload_flow_log_bucket_name
  label                  = var.workload_flow_log_bucket_label
  cross_region_location  = var.workload_flow_log_bucket_cross_region_location
  storage_class          = var.workload_flow_log_bucket_storage_class
  allowed_ip             = var.workload_flow_log_bucket_allowed_ip == null ? null : jsondecode(var.workload_flow_log_bucket_allowed_ip)
}
module "workload2_flow_log_bucket" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-object-storage-bucket?ref=v0.5.0"

  resource_group_name    = module.workload2_resource_group.name
  cos_instance_id        = module.workload2_cos.id
  kms_key_crn            = module.workload2_kms_key.crn
  activity_tracker_crn   = var.workload2_flow_log_bucket_activity_tracker_crn
  metrics_monitoring_crn = var.workload2_flow_log_bucket_metrics_monitoring_crn
  vpc_ip_addresses       = module.workload2_vpc.addresses
  ibmcloud_api_key       = var.ibmcloud_api_key
  region                 = var.region
  name_prefix            = var.workload2_name_prefix
  provision              = var.workload2_flow_log_bucket_provision
  name                   = var.workload2_flow_log_bucket_name
  label                  = var.workload2_flow_log_bucket_label
  cross_region_location  = var.workload2_flow_log_bucket_cross_region_location
  storage_class          = var.workload2_flow_log_bucket_storage_class
  allowed_ip             = var.workload2_flow_log_bucket_allowed_ip == null ? null : jsondecode(var.workload2_flow_log_bucket_allowed_ip)
}
module "workload3_flow_log_bucket" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-object-storage-bucket?ref=v0.5.0"

  resource_group_name    = module.workload3_resource_group.name
  cos_instance_id        = module.workload3_cos.id
  kms_key_crn            = module.workload3_kms_key.crn
  activity_tracker_crn   = var.workload3_flow_log_bucket_activity_tracker_crn
  metrics_monitoring_crn = var.workload3_flow_log_bucket_metrics_monitoring_crn
  vpc_ip_addresses       = module.workload3_vpc.addresses
  ibmcloud_api_key       = var.ibmcloud_api_key
  region                 = var.region
  name_prefix            = var.workload3_name_prefix
  provision              = var.workload3_flow_log_bucket_provision
  name                   = var.workload3_flow_log_bucket_name
  label                  = var.workload3_flow_log_bucket_label
  cross_region_location  = var.workload3_flow_log_bucket_cross_region_location
  storage_class          = var.workload3_flow_log_bucket_storage_class
  allowed_ip             = var.workload3_flow_log_bucket_allowed_ip == null ? null : jsondecode(var.workload3_flow_log_bucket_allowed_ip)
}

module "mgmt_flow_logs" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-flow-log?ref=v1.0.0"

  resource_group_id = module.mgmt_resource_group.id
  cos_bucket_name   = module.mgmt_flow_log_bucket.bucket_name
  target_count      = module.management_vpc.count
  target_ids        = module.management_vpc.ids
  target_names      = module.management_vpc.names
  auth_id           = module.mgmt_flow_log_auth.id
  region            = var.region
  ibmcloud_api_key  = var.ibmcloud_api_key
  provision         = var.mgmt_flow_logs_provision
}

module "workload_flow_logs" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-flow-log?ref=v1.0.0"

  resource_group_id = module.workload_resource_group.id
  cos_bucket_name   = module.workload_flow_log_bucket.bucket_name
  target_count      = module.workload_vpc.count
  target_ids        = module.workload_vpc.ids
  target_names      = module.workload_vpc.names
  auth_id           = module.workload_flow_log_auth.id
  region            = var.region
  ibmcloud_api_key  = var.ibmcloud_api_key
  provision         = var.workload_flow_logs_provision
}
module "workload2_flow_logs" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-flow-log?ref=v1.0.0"

  resource_group_id = module.workload2_resource_group.id
  cos_bucket_name   = module.workload2_flow_log_bucket.bucket_name
  target_count      = module.workload2_vpc.count
  target_ids        = module.workload2_vpc.ids
  target_names      = module.workload2_vpc.names
  auth_id           = module.workload2_flow_log_auth.id
  region            = var.region
  ibmcloud_api_key  = var.ibmcloud_api_key
  provision         = var.workload2_flow_logs_provision
}
module "workload3_flow_logs" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-flow-log?ref=v1.0.0"

  resource_group_id = module.workload3_resource_group.id
  cos_bucket_name   = module.workload3_flow_log_bucket.bucket_name
  target_count      = module.workload3_vpc.count
  target_ids        = module.workload3_vpc.ids
  target_names      = module.workload3_vpc.names
  auth_id           = module.workload3_flow_log_auth.id
  region            = var.region
  ibmcloud_api_key  = var.ibmcloud_api_key
  provision         = var.workload3_flow_logs_provision
}

module "mgmt_vsi_encrypt_auth" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-iam-service-authorization?ref=v1.1.2"

  source_service_name         = var.mgmt_vsi_encrypt_auth_source_service_name
  source_resource_instance_id = var.mgmt_vsi_encrypt_auth_source_resource_instance_id
  source_resource_type        = var.mgmt_vsi_encrypt_auth_source_resource_type
  source_resource_group_id    = var.mgmt_vsi_encrypt_auth_source_resource_group_id
  provision                   = var.mgmt_vsi_encrypt_auth_provision
  target_service_name         = var.kms_service == "hpcs" ? "hs-crypto" : "kms"
  target_resource_instance_id = var.mgmt_vsi_encrypt_auth_target_resource_instance_id
  target_resource_type        = var.mgmt_vsi_encrypt_auth_target_resource_type
  target_resource_group_id    = module.kms_resource_group.id
  roles                       = var.mgmt_vsi_encrypt_auth_roles == null ? null : jsondecode(var.mgmt_vsi_encrypt_auth_roles)
  source_service_account      = var.mgmt_vsi_encrypt_auth_source_service_account
}

## Enable this only if management and workload resource groups are separate
# module "workload_vsi_encrypt_auth" {
#   source = "github.com/cloud-native-toolkit/terraform-ibm-iam-service-authorization?ref=v1.1.2"

#   source_service_name         = var.workload_vsi_encrypt_auth_source_service_name
#   source_resource_instance_id = var.workload_vsi_encrypt_auth_source_resource_instance_id
#   source_resource_type        = var.workload_vsi_encrypt_auth_source_resource_type
#   source_resource_group_id    = var.workload_vsi_encrypt_auth_source_resource_group_id
#   provision                   = var.workload_vsi_encrypt_auth_provision
#   target_service_name         = var.kms_service == "hpcs" ? "hs-crypto" : "kms"
#   target_resource_instance_id = var.workload_vsi_encrypt_auth_target_resource_instance_id
#   target_resource_type        = var.workload_vsi_encrypt_auth_target_resource_type
#   target_resource_group_id    = module.hpcs_resource_group.id
#   roles                       = var.workload_vsi_encrypt_auth_roles == null ? null : jsondecode(var.workload_vsi_encrypt_auth_roles)
#   source_service_account      = var.workload_vsi_encrypt_auth_source_service_account
# }
## END - Enable this only if management and workload resource groups are separate

module "management_vpc" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc?ref=v1.11.3"

  resource_group_id    = module.mgmt_resource_group.id
  resource_group_name  = module.mgmt_resource_group.name
  region               = var.region
  name                 = var.management_vpc_name
  name_prefix          = var.mgmt_name_prefix
  ibmcloud_api_key     = var.ibmcloud_api_key
  provision            = var.management_vpc_provision
  address_prefix_count = var.management_vpc_address_prefix_count
  address_prefixes     = var.management_vpc_address_prefixes == null ? null : jsondecode(var.management_vpc_address_prefixes)
}

module "workload_vpc" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc?ref=v1.11.3"

  resource_group_id    = module.workload_resource_group.id
  resource_group_name  = module.workload_resource_group.name
  region               = var.region
  name                 = var.workload_vpc_name
  name_prefix          = var.workload_name_prefix
  ibmcloud_api_key     = var.ibmcloud_api_key
  provision            = var.workload_vpc_provision
  address_prefix_count = var.workload_vpc_address_prefix_count
  address_prefixes     = var.workload_vpc_address_prefixes == null ? null : jsondecode(var.workload_vpc_address_prefixes)
}
module "workload2_vpc" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc?ref=v1.11.3"

  resource_group_id    = module.workload2_resource_group.id
  resource_group_name  = module.workload2_resource_group.name
  region               = var.region
  name                 = var.workload2_vpc_name
  name_prefix          = var.workload2_name_prefix
  ibmcloud_api_key     = var.ibmcloud_api_key
  provision            = var.workload2_vpc_provision
  address_prefix_count = var.workload2_vpc_address_prefix_count
  address_prefixes     = var.workload2_vpc_address_prefixes == null ? null : jsondecode(var.workload2_vpc_address_prefixes)
}
module "workload3_vpc" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc?ref=v1.11.3"

  resource_group_id    = module.workload3_resource_group.id
  resource_group_name  = module.workload3_resource_group.name
  region               = var.region
  name                 = var.workload3_vpc_name
  name_prefix          = var.workload3_name_prefix
  ibmcloud_api_key     = var.ibmcloud_api_key
  provision            = var.workload3_vpc_provision
  address_prefix_count = var.workload3_vpc_address_prefix_count
  address_prefixes     = var.workload3_vpc_address_prefixes == null ? null : jsondecode(var.workload3_vpc_address_prefixes)
}
module "mgmt_vpn_gateway" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpn-gateway.git?ref=v1.0.0"

  resource_group_id = module.mgmt_resource_group.id
  region            = var.region
  ibmcloud_api_key  = var.ibmcloud_api_key
  vpc_name          = module.management_vpc.name
  vpc_subnet_count  = 1
  vpc_subnets       = [module.mgmt_subnets.subnets[0]]
  tags              = (var.tags != null ? var.tags : [])
  mode              = var.mode
}
module "workload_vpn_gateway" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpn-gateway.git?ref=v1.0.0"

  resource_group_id = module.workload_resource_group.id
  region            = var.region
  ibmcloud_api_key  = var.ibmcloud_api_key
  vpc_name          = module.workload_vpc.name
  vpc_subnet_count  = 1
  vpc_subnets       = [module.workload_subnets.subnets[0]]
  tags              = (var.tags != null ? var.tags : [])
  mode              = var.mode
  provision         = var.workload_vpn_provision
}
module "workload2_vpn_gateway" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpn-gateway.git?ref=v1.0.0"

  resource_group_id = module.workload2_resource_group.id
  region            = var.region
  ibmcloud_api_key  = var.ibmcloud_api_key
  vpc_name          = module.workload2_vpc.name
  vpc_subnet_count  = 1
  vpc_subnets       = [module.workload2_subnets.subnets[0]]
  tags              = (var.tags != null ? var.tags : [])
  mode              = var.mode
  provision         = var.workload2_vpn_provision
}
module "workload3_vpn_gateway" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpn-gateway.git?ref=v1.0.0"

  resource_group_id = module.workload3_resource_group.id
  region            = var.region
  ibmcloud_api_key  = var.ibmcloud_api_key
  vpc_name          = module.workload3_vpc.name
  vpc_subnet_count  = 1
  vpc_subnets       = [module.workload3_subnets.subnets[0]]
  tags              = (var.tags != null ? var.tags : [])
  mode              = var.mode
  provision         = var.workload3_vpn_provision
}


module "mgmt_ssh_vsi" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-ssh?ref=v1.5.1"

  resource_group_name = module.mgmt_resource_group.name
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name_prefix         = var.mgmt_name_prefix
  name                = var.mgmt_ssh_vsi_name
  label               = var.mgmt_ssh_vsi_label
  public_key          = var.mgmt_ssh_vsi_public_key
  private_key         = var.mgmt_ssh_vsi_private_key
  public_key_file     = var.mgmt_ssh_vsi_public_key_file
  private_key_file    = var.mgmt_ssh_vsi_private_key_file
  rsa_bits            = var.mgmt_ssh_vsi_rsa_bits
}


module "workload_ssh_vsi" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-ssh?ref=v1.5.1"

  resource_group_name = module.workload_resource_group.name
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name_prefix         = var.workload_name_prefix
  name                = var.workload_ssh_vsi_name
  label               = var.workload_ssh_vsi_label
  public_key          = var.workload_ssh_vsi_public_key
  private_key         = var.workload_ssh_vsi_private_key
  public_key_file     = var.workload_ssh_vsi_public_key_file
  private_key_file    = var.workload_ssh_vsi_private_key_file
  rsa_bits            = var.workload_ssh_vsi_rsa_bits
}
module "workload2_ssh_vsi" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-ssh?ref=v1.5.1"

  resource_group_name = module.workload2_resource_group.name
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name_prefix         = var.workload2_name_prefix
  name                = var.workload2_ssh_vsi_name
  label               = var.workload2_ssh_vsi_label
  public_key          = var.workload2_ssh_vsi_public_key
  private_key         = var.workload2_ssh_vsi_private_key
  public_key_file     = var.workload2_ssh_vsi_public_key_file
  private_key_file    = var.workload2_ssh_vsi_private_key_file
  rsa_bits            = var.workload2_ssh_vsi_rsa_bits
}
module "workload3_ssh_vsi" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-ssh?ref=v1.5.1"

  resource_group_name = module.workload3_resource_group.name
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name_prefix         = var.workload2_name_prefix
  name                = var.workload3_ssh_vsi_name
  label               = var.workload3_ssh_vsi_label
  public_key          = var.workload3_ssh_vsi_public_key
  private_key         = var.workload3_ssh_vsi_private_key
  public_key_file     = var.workload3_ssh_vsi_public_key_file
  private_key_file    = var.workload3_ssh_vsi_private_key_file
  rsa_bits            = var.workload3_ssh_vsi_rsa_bits
}
module "mgmt_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.mgmt_resource_group.id
  vpc_name           = module.management_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.mgmt_subnets__count
  label              = var.mgmt_subnets_label
  zone_offset        = var.mgmt_subnets_zone_offset
  ipv4_cidr_blocks   = var.mgmt_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.mgmt_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.mgmt_subnets_ipv4_address_count
  provision          = var.mgmt_subnets_provision
  acl_rules          = var.mgmt_subnets_acl_rules == null ? null : jsondecode(var.mgmt_subnets_acl_rules)
}
module "mgmt_vpe_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.mgmt_resource_group.id
  vpc_name           = module.management_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.mgmt_vpe_subnets__count
  label              = var.mgmt_vpe_subnets_label
  zone_offset        = var.mgmt_vpe_subnets_zone_offset
  ipv4_cidr_blocks   = var.mgmt_vpe_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.mgmt_vpe_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.mgmt_vpe_subnets_ipv4_address_count
  provision          = var.mgmt_vpe_subnets_provision
  acl_rules          = var.mgmt_vpe_subnets_acl_rules == null ? null : jsondecode(var.mgmt_vpe_subnets_acl_rules)
}

module "mgmt_vpn_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.mgmt_resource_group.id
  vpc_name           = module.management_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.mgmt_vpn_subnets__count
  label              = var.mgmt_vpn_subnets_label
  zone_offset        = var.mgmt_vpn_subnets_zone_offset
  ipv4_cidr_blocks   = var.mgmt_vpn_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.mgmt_vpn_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.mgmt_vpn_subnets_ipv4_address_count
  provision          = var.mgmt_vpn_subnets_provision
  acl_rules          = var.mgmt_vpn_subnets_acl_rules == null ? null : jsondecode(var.mgmt_vpn_subnets_acl_rules)
}


module "workload_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.workload_resource_group.id
  vpc_name           = module.workload_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.workload_subnets__count
  label              = var.workload_subnets_label
  zone_offset        = var.workload_subnets_zone_offset
  ipv4_cidr_blocks   = var.workload_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.workload_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.workload_subnets_ipv4_address_count
  provision          = var.workload_subnets_provision
  acl_rules          = var.workload_subnets_acl_rules == null ? null : jsondecode(var.workload_subnets_acl_rules)
}
module "workload2_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.workload2_resource_group.id
  vpc_name           = module.workload2_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.workload2_subnets__count
  label              = var.workload2_subnets_label
  zone_offset        = var.workload2_subnets_zone_offset
  ipv4_cidr_blocks   = var.workload2_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.workload2_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.workload2_subnets_ipv4_address_count
  provision          = var.workload2_subnets_provision
  acl_rules          = var.workload2_subnets_acl_rules == null ? null : jsondecode(var.workload2_subnets_acl_rules)
}
module "workload3_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.workload3_resource_group.id
  vpc_name           = module.workload3_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.workload3_subnets__count
  label              = var.workload3_subnets_label
  zone_offset        = var.workload3_subnets_zone_offset
  ipv4_cidr_blocks   = var.workload3_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.workload3_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.workload3_subnets_ipv4_address_count
  provision          = var.workload3_subnets_provision
  acl_rules          = var.workload3_subnets_acl_rules == null ? null : jsondecode(var.workload3_subnets_acl_rules)
}

module "workload_vpe_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.workload_resource_group.id
  vpc_name           = module.workload_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.workload_vpe_subnets__count
  label              = var.workload_vpe_subnets_label
  zone_offset        = var.workload_vpe_subnets_zone_offset
  ipv4_cidr_blocks   = var.workload_vpe_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.workload_vpe_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.workload_vpe_subnets_ipv4_address_count
  provision          = var.workload_vpe_subnets_provision
  acl_rules          = var.workload_vpe_subnets_acl_rules == null ? null : jsondecode(var.workload_vpe_subnets_acl_rules)
}
module "workload2_vpe_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.workload2_resource_group.id
  vpc_name           = module.workload2_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.workload2_vpe_subnets__count
  label              = var.workload2_vpe_subnets_label
  zone_offset        = var.workload2_vpe_subnets_zone_offset
  ipv4_cidr_blocks   = var.workload2_vpe_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.workload2_vpe_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.workload2_vpe_subnets_ipv4_address_count
  provision          = var.workload2_vpe_subnets_provision
  acl_rules          = var.workload2_vpe_subnets_acl_rules == null ? null : jsondecode(var.workload2_vpe_subnets_acl_rules)
}
module "workload3_vpe_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.workload3_resource_group.id
  vpc_name           = module.workload3_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.workload3_vpe_subnets__count
  label              = var.workload3_vpe_subnets_label
  zone_offset        = var.workload3_vpe_subnets_zone_offset
  ipv4_cidr_blocks   = var.workload3_vpe_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.workload3_vpe_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.workload3_vpe_subnets_ipv4_address_count
  provision          = var.workload3_vpe_subnets_provision
  acl_rules          = var.workload3_vpe_subnets_acl_rules == null ? null : jsondecode(var.workload3_vpe_subnets_acl_rules)
}

module "workload_vpn_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.workload_resource_group.id
  vpc_name           = module.workload_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.workload_vpn_subnets__count
  label              = var.workload_vpn_subnets_label
  zone_offset        = var.workload_vpn_subnets_zone_offset
  ipv4_cidr_blocks   = var.workload_vpn_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.workload_vpn_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.workload_vpn_subnets_ipv4_address_count
  provision          = var.workload_vpn_subnets_provision
  acl_rules          = var.workload_vpn_subnets_acl_rules == null ? null : jsondecode(var.workload_vpn_subnets_acl_rules)
}
module "workload2_vpn_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.workload2_resource_group.id
  vpc_name           = module.workload2_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.workload2_vpn_subnets__count
  label              = var.workload2_vpn_subnets_label
  zone_offset        = var.workload2_vpn_subnets_zone_offset
  ipv4_cidr_blocks   = var.workload2_vpn_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.workload2_vpn_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.workload2_vpn_subnets_ipv4_address_count
  provision          = var.workload2_vpn_subnets_provision
  acl_rules          = var.workload2_vpn_subnets_acl_rules == null ? null : jsondecode(var.workload2_vpn_subnets_acl_rules)
}
module "workload3_vpn_subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.8.1"

  resource_group_id  = module.workload3_resource_group.id
  vpc_name           = module.workload3_vpc.name
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.workload3_vpn_subnets__count
  label              = var.workload3_vpn_subnets_label
  zone_offset        = var.workload3_vpn_subnets_zone_offset
  ipv4_cidr_blocks   = var.workload3_vpn_subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.workload3_vpn_subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.workload3_vpn_subnets_ipv4_address_count
  provision          = var.workload3_vpn_subnets_provision
  acl_rules          = var.workload3_vpn_subnets_acl_rules == null ? null : jsondecode(var.workload3_vpn_subnets_acl_rules)
}

module "mgmt_vpe_cos" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpe-gateway?ref=v1.4.0"

  resource_group_name = module.mgmt_resource_group.name
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name_prefix         = var.mgmt_name_prefix
  vpc_id              = module.management_vpc.id
  vpc_subnets         = module.mgmt_vpe_subnets.subnets
  vpc_subnet_count    = module.mgmt_vpe_subnets.count
  resource_crn        = module.mgmt_cos.crn
  resource_service    = module.mgmt_cos.service
  resource_label      = module.mgmt_cos.label
}

module "mgmt_vpe_containerregistry" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpe-gateway?ref=v1.4.0"

  depends_on = [module.mgmt_vpe_cos]

  resource_group_name = module.mgmt_resource_group.name
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name_prefix         = var.mgmt_name_prefix
  vpc_id              = module.management_vpc.id
  vpc_subnets         = module.mgmt_vpe_subnets.subnets
  vpc_subnet_count    = module.mgmt_vpe_subnets.count
  resource_crn        = var.mgmt_vpe_containerregistry_crn
  resource_service    = "container-registry"
  resource_label      = "icr"
}

module "workload_vpe_cos" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpe-gateway?ref=v1.4.0"

  depends_on = [module.mgmt_vpe_containerregistry]

  resource_group_name = module.workload_resource_group.name
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name_prefix         = var.workload_name_prefix
  vpc_id              = module.workload_vpc.id
  vpc_subnets         = module.workload_vpe_subnets.subnets
  vpc_subnet_count    = module.workload_vpe_subnets.count
  resource_crn        = module.workload_cos.crn
  resource_service    = module.workload_cos.service
  resource_label      = module.workload_cos.label
}
module "workload2_vpe_cos" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpe-gateway?ref=v1.4.0"

  depends_on = [module.mgmt_vpe_containerregistry]

  resource_group_name = module.workload2_resource_group.name
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name_prefix         = var.workload2_name_prefix
  vpc_id              = module.workload2_vpc.id
  vpc_subnets         = module.workload2_vpe_subnets.subnets
  vpc_subnet_count    = module.workload2_vpe_subnets.count
  resource_crn        = module.workload2_cos.crn
  resource_service    = module.workload2_cos.service
  resource_label      = module.workload2_cos.label
}
module "workload3_vpe_cos" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpe-gateway?ref=v1.4.0"

  depends_on = [module.mgmt_vpe_containerregistry]

  resource_group_name = module.workload3_resource_group.name
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name_prefix         = var.workload3_name_prefix
  vpc_id              = module.workload3_vpc.id
  vpc_subnets         = module.workload3_vpe_subnets.subnets
  vpc_subnet_count    = module.workload3_vpe_subnets.count
  resource_crn        = module.workload3_cos.crn
  resource_service    = module.workload3_cos.service
  resource_label      = module.workload3_cos.label
}

## Enable this if using different resource groups for workload and management
# module "workload_vpe_containerregistry" {
#   source = "github.com/cloud-native-toolkit/terraform-ibm-vpe-gateway?ref=v1.4.0"

#   depends_on = [ module.workload_vpe_cos ]

#   resource_group_name = module.workload_resource_group.name
#   region              = var.region
#   ibmcloud_api_key    = var.ibmcloud_api_key
#   name_prefix         = var.workload_name_prefix
#   vpc_id              = module.workload_vpc.id
#   vpc_subnets         = module.workload_vpe_subnets.subnets
#   vpc_subnet_count    = module.workload_vpe_subnets.count
#   resource_crn        = var.workload_vpe_containerregistry_crn
#   resource_service    = "container-registry"
#   resource_label      = "icr"
# }
## END - Enable this if using different resource groups for workload and management

## Sample code to start up VSI's within the different VPC's
module "mgmt_vpc_vsi" {
  source                 = "github.com/cloud-native-toolkit/terraform-ibm-vpc-vsi?ref=v1.6.0"
  resource_group_id      = module.mgmt_resource_group.id
  region                 = var.region
  ibmcloud_api_key       = var.ibmcloud_api_key
  vpc_name               = module.management_vpc.name
  vpc_subnet_count       = module.mgmt_subnets.count
  vpc_subnets            = module.mgmt_subnets.subnets
  ssh_key_id             = module.mgmt_ssh_vsi.id
  kms_key_crn            = module.mgmt_kms_key.crn
  kms_enabled            = var.kms_enabled
  image_name             = var.mgmt_vpc_vsi_image_name
  allow_deprecated_image = false
  base_security_group    = module.management_vpc.base_security_group
  count                  = var.mgmt_vsi_count
}

module "workload_vpc_vsi" {
  source                 = "github.com/cloud-native-toolkit/terraform-ibm-vpc-vsi?ref=v1.6.0"
  resource_group_id      = module.workload_resource_group.id
  region                 = var.region
  ibmcloud_api_key       = var.ibmcloud_api_key
  vpc_name               = module.workload_vpc.name
  vpc_subnet_count       = module.workload_subnets.count
  vpc_subnets            = module.workload_subnets.subnets
  ssh_key_id             = module.workload_ssh_vsi.id
  kms_key_crn            = module.workload_kms_key.crn
  kms_enabled            = var.kms_enabled
  allow_deprecated_image = false
  image_name             = var.workload_vpc_vsi_image_name
  base_security_group    = module.workload_vpc.base_security_group
  label                  = "srv-${count.index}"
  count                  = var.workload_vsi_count
}
module "workload2_vpc_vsi" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-vsi?ref=v1.6.0"

  resource_group_id      = module.workload2_resource_group.id
  region                 = var.region
  ibmcloud_api_key       = var.ibmcloud_api_key
  vpc_name               = module.workload2_vpc.name
  vpc_subnet_count       = module.workload2_subnets.count
  vpc_subnets            = module.workload2_subnets.subnets
  ssh_key_id             = module.workload2_ssh_vsi.id
  kms_key_crn            = module.workload2_kms_key.crn
  kms_enabled            = var.kms_enabled
  allow_deprecated_image = false
  image_name             = var.workload2_vpc_vsi_image_name
  base_security_group    = module.workload2_vpc.base_security_group
  label                  = "srv-${count.index}"
  count                  = var.workload2_vsi_count
}
module "workload3_vpc_vsi" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-vsi?ref=v1.6.0"

  resource_group_id      = module.workload3_resource_group.id
  region                 = var.region
  ibmcloud_api_key       = var.ibmcloud_api_key
  vpc_name               = module.workload3_vpc.name
  vpc_subnet_count       = module.workload3_subnets.count
  vpc_subnets            = module.workload3_subnets.subnets
  ssh_key_id             = module.workload3_ssh_vsi.id
  kms_key_crn            = module.workload3_kms_key.crn
  kms_enabled            = var.kms_enabled
  allow_deprecated_image = false
  image_name             = var.workload3_vpc_vsi_image_name
  base_security_group    = module.workload3_vpc.base_security_group
  label                  = "srv-${count.index}"
  count                  = var.workload3_vsi_count
}

module "ibm_transit_gateway" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-transit-gateway?ref=v0.1.0"

  resource_group_name = module.cs_resource_group.name
  connections         = [module.workload_vpc.crn, module.management_vpc.crn, module.workload2_vpc.crn, module.workload3_vpc.crn]
  region              = var.region
  name                = var.ibm_transit_gateway_name
  name_prefix         = var.name_prefix
  ibmcloud_api_key    = var.ibmcloud_api_key
}
module "logdna" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-logdna?ref=v3.3.1"

  resource_group_name = module.cs_resource_group.name
  region = var.region
  name_prefix = var.cs_name_prefix
  plan = var.logdna_plan
  tags = var.logdna_tags == null ? null : jsondecode(var.logdna_tags)
  provision = var.logdna_provision
  name = var.logdna_name
  label = var.logdna_label

}
module "sysdig" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-sysdig?ref=v3.4.0"

  resource_group_name = module.cs_resource_group.name
  region = var.region
  name_prefix = var.cs_name_prefix
  ibmcloud_api_key = var.ibmcloud_api_key
  plan = var.sysdig_plan
  tags = var.sysdig_tags == null ? null : jsondecode(var.sysdig_tags)
  provision = var.sysdig_provision
  name = var.sysdig_name
  label = var.sysdig_label

}
module "ibm-activity-tracker" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-activity-tracker?ref=v2.3.0"

  resource_group_name = module.cs_resource_group.name
  resource_location = var.region
  tags = var.ibm-activity-tracker_tags == null ? null : jsondecode(var.ibm-activity-tracker_tags)
  plan = var.ibm-activity-tracker_plan
  provision = var.ibm-activity-tracker_provision

}

##########################
#######SECURITY###########
##########################
//cis_provision = false
//cis_name = "cis_sample"
//cis_tags = "[]"

//Old-1
//module "ibm-cis-domain" {
//  source = "./modules"
//}

module "ibm-cis-domain" {
    source  =  "./modules"
    
    resource_group_name      = module.cs_resource_group.name
    region                   = var.region
    provision                = true
    name_prefix              = var.name_prefix
}
