variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud api token"
}

variable "cs_resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "cs_resource_group_provision" {
  type        = bool
  description = "Flag indicating that the resource group should be created"
  default     = false
}

variable "kms_resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "kms_resource_group_provision" {
  type        = bool
  description = "Flag indicating that the resource group should be created"
  default     = false
}

variable "mgmt_resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "mgmt_resource_group_provision" {
  type        = bool
  description = "Flag indicating that the resource group should be created"
  default     = false
}

variable "workload_resource_group_name" {
  type        = string
  description = "The name of the resource group"
}
variable "workload2_resource_group_name" {
  type        = string
  description = "The name of the resource group"
}
variable "workload3_resource_group_name" {
  type        = string
  description = "The name of the resource group"
}
variable "workload_resource_group_provision" {
  type        = bool
  description = "Flag indicating that the resource group should be created"
  default     = false
}
variable "workload2_resource_group_provision" {
  type        = bool
  description = "Flag indicating that the resource group should be created"
  default     = false
}
variable "workload3_resource_group_provision" {
  type        = bool
  description = "Flag indicating that the resource group should be created"
  default     = false
}
variable "region" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
}

variable "kms_name_prefix" {
  type        = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
  default     = ""
}

variable "kms_name" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = ""
}

variable "kms_private_endpoint" {
  type        = string
  description = "Flag indicating that the service should be created with private endpoints"
  default     = "true"
}

variable "kms_plan" {
  type        = string
  description = "The type of plan the service instance should run under (tiered-pricing)"
  default     = "standard"
}

variable "kms_tags" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "[]"
}

variable "kms_number_of_crypto_units" {
  type        = number
  description = "No of crypto units that has to be attached to the instance."
  default     = 2
}

variable "kms_provision" {
  type        = bool
  description = "Flag indicating that kms instance should be provisioned. If 'false' then the instance is expected to already exist."
  default     = false
}

variable "kms_region" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "us-south"
}

variable "kms_service" {
  type        = string
 description = "Option to select between 'HPCS' or 'kms' - KeyProtect"
  default     = "kms"
}

# Enable if want HPCS initialized
#variable "hpcs_initialize" {
#  type        = bool
#  description = "Flag indicating that if user want to initialize the hpcs instance. If 'true' then the instance is expected to initialize."
#  default     = false
#}

# Path to which CLOUDTKEFILES has to be exported 
#variable "tke_files_path" {
#  type        = string
#  description = "Path to which tke files has to be exported"
#  default     = ""
#}

# variable "admin1_name" {
#  type        = string
#  description = "First admin name"
#  default     = ""
#}

# variable "admin1_password" {
#  type        = string
#  description = "First admin password"
#  default     = ""
#}

#variable "admin2_name" {
#  type        = string
#  description = "Second admin name"
#  default     = ""
#}

#variable "admin2_password" {
#  type        = string
#  description = "second admin password"
#  default     = ""
#}

#variable "admin_num" {
#  type        = number
#  description = "Number of admins to manage HPCS"
#  default     = 2
#}

#variable "threshold_value" {
#  type        = number
#  description = "Threshold value"
#  default     = 2
#}

#variable "rev_threshold_value" {
#  type        = number
#  description = "Remove / delete threshold value"
#  default     = 2
#}

# COS Credentials upload to cos
#variable "cos_crn" {
#  type        = string
#  description = "COS instance CRN"
#  default     = ""
#}

#variable "endpoint" {
#  type        = string
#  description = "COS endpoint"
#  default     = "s3.us-south.cloud-object-storage.appdomain.cloud"
#}

#variable "bucket_name" {
#  type        = string
#  description = "COS bucket name"
#  default     = "bootstrap-bucket-hpcs999"
#}

#variable "allowed_network_type" {
#  type        = string
#  description = "The network access policy to apply to your Hyper Protect Crypto Services instance. Acceptable values are public-and-private or private-only.After the network access policy is set to private-only, you cannot access your instance from the public network and cannot view or manage keys through the UI. However, you can still adjust the network setting later using the API or CLI"
#  default     = "public-and-private"
#}

#variable "hpcs_port" {
#  type        = number
#  description = "HPCS service port"
#  default     = 11705
#}

#variable "dual_auth_delete" {
#  type        = bool
#  description = "Dual auth deletion policy enabled or not"
#  default     = true
#}
# End: Enable if want HPCS initialized

variable "name_prefix" {
  type        = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
  default     = "acnp1"
}
variable "mgmt_flow_logs_auth_id" {
  type        = string
  description = "The id of the service authorization that allows the flow log to write to the cos bucket"
  default     = ""
}

variable "mgmt_flow_logs_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}

variable "workload_flow_logs_auth_id" {
  type        = string
  description = "The id of the service authorization that allows the flow log to write to the cos bucket"
  default     = ""
}
variable "workload2_flow_logs_auth_id" {
  type        = string
  description = "The id of the service authorization that allows the flow log to write to the cos bucket"
  default     = ""
}
variable "workload3_flow_logs_auth_id" {
  type        = string
  description = "The id of the service authorization that allows the flow log to write to the cos bucket"
  default     = ""
}

variable "workload_flow_logs_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}
variable "workload2_flow_logs_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}
variable "workload3_flow_logs_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}

variable "mgmt_vsi_encrypt_auth_source_service_name" {
  type        = string
  description = "The name of the service that will be authorized to access the target service. This value is the name of the service as it appears in the service catalog."
  default     = "server-protect"
}

variable "mgmt_vsi_encrypt_auth_source_resource_instance_id" {
  type        = string
  description = "The instance id of the source service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}

variable "mgmt_vsi_encrypt_auth_source_resource_group_id" {
  type        = string
  description = "Resource group ID of the source instance"
  default     = null
}

variable "mgmt_vsi_encrypt_auth_provision" {
  type        = bool
  description = "Should the authorization be provisioned"
  default     = true
}

variable "mgmt_vsi_encrypt_auth_source_resource_type" {
  type        = string
  description = "The resource type of the source service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}
variable "mgmt_vsi_encrypt_auth_target_resource_instance_id" {
  type        = string
  description = "The instance id of the target service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}

variable "mgmt_vsi_encrypt_auth_target_resource_type" {
  type        = string
  description = "The resource type of the target service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}

variable "mgmt_vsi_encrypt_auth_roles" {
  type        = string
  description = "A list of roles that should be granted on the target service (e.g. Reader, Writer)."
  default     = "[\"Reader\"]"
}
variable "mgmt_vsi_encrypt_auth_source_service_account" {
  type        = string
  description = "GUID of the account where the source service is provisioned. This is required to authorize service access across accounts."
  default     = null
}
variable "workload_vsi_encrypt_auth_source_service_name" {
  type        = string
  description = "The name of the service that will be authorized to access the target service. This value is the name of the service as it appears in the service catalog."
  default     = "server-protect"
}
variable "workload_vsi_encrypt_auth_source_resource_instance_id" {
  type        = string
  description = "The instance id of the source service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}
variable "workload_vsi_encrypt_auth_source_resource_group_id" {
  type        = string
  description = "Resource group ID of the source instance"
  default     = null
}
variable "workload_vsi_encrypt_auth_provision" {
  type        = bool
  description = "Should the authorization be provisioned"
  default     = true
}
variable "workload_vsi_encrypt_auth_source_resource_type" {
  type        = string
  description = "The resource type of the source service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}
variable "workload_vsi_encrypt_auth_target_resource_instance_id" {
  type        = string
  description = "The instance id of the target service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}
variable "workload_vsi_encrypt_auth_target_resource_type" {
  type        = string
  description = "The resource type of the target service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}
variable "workload_vsi_encrypt_auth_roles" {
  type        = string
  description = "A list of roles that should be granted on the target service (e.g. Reader, Writer)."
  default     = "[\"Reader\"]"
}
variable "workload_vsi_encrypt_auth_source_service_account" {
  type        = string
  description = "GUID of the account where the source service is provisioned. This is required to authorize service access across accounts."
  default     = null
}
variable "mgmt_name_prefix" {
  type        = string
  description = "The name_prefix used to build the name if one is not provided. If used the name will be `{name_prefix}-{label}`"
  default     = "devmgmt"
}
variable "mgmt_kms_key_provision" {
  type        = bool
  description = "Flag indicating that the key should be provisioned. If false then an existing key will be looked up"
  default     = true
}
variable "mgmt_kms_key_name" {
  type        = string
  description = "The name of the root key in the kms instance. Required if kms_enabled is true"
  default     = "mgmt_kms_key"
}
variable "mgmt_kms_key_label" {
  type        = string
  description = "The label used to build the name if one is not provided. If used the name will be `{name_prefix}-{label}`"
  default     = "key"
}

variable "mgmt_kms_key_rotation_interval" {
  type        = number
  description = "The interval in months that a root key needs to be rotated."
  default     = 3
}

variable "mgmt_kms_key_dual_auth_delete" {
  type        = bool
  description = "Flag indicating that the key requires dual authorization to be deleted."
  default     = false
}

variable "workload_name_prefix" {
  type        = string
  description = "The name_prefix used to build the name if one is not provided. If used the name will be `{name_prefix}-{label}`"
  default     = "devwrk"
}
variable "workload2_name_prefix" {
  type        = string
  description = "The name_prefix used to build the name if one is not provided. If used the name will be `{name_prefix}-{label}`"
  default     = "devwrk2"
}
variable "workload3_name_prefix" {
  type        = string
  description = "The name_prefix used to build the name if one is not provided. If used the name will be `{name_prefix}-{label}`"
  default     = "devwrk3"
}

variable "workload_kms_key_provision" {
  type        = bool
  description = "Flag indicating that the key should be provisioned. If false then an existing key will be looked up"
  default     = true
}
variable "workload2_kms_key_provision" {
  type        = bool
  description = "Flag indicating that the key should be provisioned. If false then an existing key will be looked up"
  default     = true
}
variable "workload3_kms_key_provision" {
  type        = bool
  description = "Flag indicating that the key should be provisioned. If false then an existing key will be looked up"
  default     = true
}

variable "workload_kms_key_name" {
  type        = string
  description = "The name of the root key in the kms instance. Required if kms_enabled is true"
  default     = "snet-csable_kms_key"
}
variable "workload2_kms_key_name" {
  type        = string
  description = "The name of the root key in the kms instance. Required if kms_enabled is true"
  default     = "snet-dev_kms_key"
}
variable "workload3_kms_key_name" {
  type        = string
  description = "The name of the root key in the kms instance. Required if kms_enabled is true"
  default     = "snet-prod_kms_key"
}

variable "workload_kms_key_label" {
  type        = string
  description = "The label used to build the name if one is not provided. If used the name will be `{name_prefix}-{label}`"
  default     = "key"
}
variable "workload2_kms_key_label" {
  type        = string
  description = "The label used to build the name if one is not provided. If used the name will be `{name_prefix}-{label}`"
  default     = "key2"
}
variable "workload3_kms_key_label" {
  type        = string
  description = "The label used to build the name if one is not provided. If used the name will be `{name_prefix}-{label}`"
  default     = "key3"
}

variable "workload_kms_key_rotation_interval" {
  type        = number
  description = "The interval in months that a root key needs to be rotated."
  default     = 3
}
variable "workload2_kms_key_rotation_interval" {
  type        = number
  description = "The interval in months that a root key needs to be rotated."
  default     = 3
}
variable "workload3_kms_key_rotation_interval" {
  type        = number
  description = "The interval in months that a root key needs to be rotated."
  default     = 3
}

variable "workload_kms_key_dual_auth_delete" {
  type        = bool
  description = "Flag indicating that the key requires dual authorization to be deleted."
  default     = false
}
variable "workload2_kms_key_dual_auth_delete" {
  type        = bool
  description = "Flag indicating that the key requires dual authorization to be deleted."
  default     = false
}
variable "workload3_kms_key_dual_auth_delete" {
  type        = bool
  description = "Flag indicating that the key requires dual authorization to be deleted."
  default     = false
}

variable "mgmt_cos_resource_location" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
  default     = "global"
}

variable "mgmt_cos_tags" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "[]"
}

variable "mgmt_cos_plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite or standard)"
  default     = "standard"
}

variable "mgmt_cos_provision" {
  type        = bool
  description = "Flag indicating that key-protect instance should be provisioned"
  default     = true
}

variable "mgmt_cos_label" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = "cos"
}

variable "workload_cos_resource_location" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
  default     = "global"
}
variable "workload2_cos_resource_location" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
  default     = "global"
}
variable "workload3_cos_resource_location" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
  default     = "global"
}

variable "workload_cos_tags" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "[]"
}
variable "workload2_cos_tags" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "[]"
}
variable "workload3_cos_tags" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "[]"
}
variable "workload_cos_plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite or standard)"
  default     = "standard"
}
variable "workload2_cos_plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite or standard)"
  default     = "standard"
}
variable "workload3_cos_plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite or standard)"
  default     = "standard"
}

variable "workload_cos_provision" {
  type        = bool
  description = "Flag indicating that key-protect instance should be provisioned"
  default     = true
}
variable "workload2_cos_provision" {
  type        = bool
  description = "Flag indicating that key-protect instance should be provisioned"
  default     = true
}
variable "workload3_cos_provision" {
  type        = bool
  description = "Flag indicating that key-protect instance should be provisioned"
  default     = true
}


variable "workload_cos_label" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = "cos"
}
variable "workload2_cos_label" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = "cos2"
}
variable "workload3_cos_label" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = "cos3"
}

variable "management_vpc_name" {
  type        = string
  description = "The name of the vpc instance"
  default     = ""
}

variable "management_vpc_provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}

# comment this variable when using custom prefixes in tfvars
variable "management_vpc_address_prefix_count" {
  type        = number
  description = "The number of ipv4_cidr_blocks"
  default     = 3
}

# comment this variable when using custom prefixes in tfvars
variable "management_vpc_address_prefixes" {
  type        = string
  description = "List of ipv4 cidr blocks for the address prefixes (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.10.0.0/18\",\"10.20.0.0/18\",\"10.30.0.0/18\"]"
}

variable "workload_vpc_name" {
  type        = string
  description = "The name of the vpc instance"
  default     = ""
}
variable "workload2_vpc_name" {
  type        = string
  description = "The name of the vpc instance"
  default     = ""
}
variable "workload3_vpc_name" {
  type        = string
  description = "The name of the vpc instance"
  default     = ""
}

variable "workload_vpc_provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}
variable "workload2_vpc_provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}
variable "workload3_vpc_provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}

# comment this variable when using custom prefixes in tfvars
variable "workload_vpc_address_prefix_count" {
  type        = number
  description = "The number of ipv4_cidr_blocks"
  default     = 3
}
variable "workload2_vpc_address_prefix_count" {
  type        = number
  description = "The number of ipv4_cidr_blocks"
  default     = 3
}
variable "workload3_vpc_address_prefix_count" {
  type        = number
  description = "The number of ipv4_cidr_blocks"
  default     = 3
}
# comment this variable when using custom prefixes in tfvars
variable "workload_vpc_address_prefixes" {
  type        = string
  description = "List of ipv4 cidr blocks for the address prefixes (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.40.0.0/18\",\"10.50.0.0/18\",\"10.60.0.0/18\"]"
}
variable "workload2_vpc_address_prefixes" {
  type        = string
  description = "List of ipv4 cidr blocks for the address prefixes (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.70.0.0/18\",\"10.80.0.0/18\",\"10.90.0.0/18\"]"
}
variable "workload3_vpc_address_prefixes" {
  type        = string
  description = "List of ipv4 cidr blocks for the address prefixes (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.100.0.0/18\",\"10.110.0.0/18\",\"10.120.0.0/18\"]"
}

variable "mgmt_flow_log_bucket_activity_tracker_crn" {
  type        = string
  description = "The crn of the Activity Tracking instance"
  default     = null
}

variable "mgmt_flow_log_bucket_metrics_monitoring_crn" {
  type        = string
  description = "The crn of the Metrics Monitoring instance"
  default     = null
}

variable "mgmt_flow_log_bucket_provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}

variable "mgmt_flow_log_bucket_name" {
  type        = string
  description = "Name of the bucket"
  default     = ""
}

variable "mgmt_flow_log_bucket_label" {
  type        = string
  description = "Label used to build the bucket name of not provided."
  default     = "flow-logs"
}

variable "mgmt_flow_log_bucket_cross_region_location" {
  type        = string
  description = "The cross-region location of the bucket. This value is optional. Valid values are (us, eu, and ap). This value takes precedence over others if provided."
  default     = ""
}

variable "mgmt_flow_log_bucket_storage_class" {
  type        = string
  description = "Storage class of the bucket. Supported values are standard, vault, cold, flex, smart."
  default     = "standard"
}

variable "mgmt_flow_log_bucket_allowed_ip" {
  type        = string
  description = "A list of IPv4 or IPv6 addresses in CIDR notation that you want to allow access to your IBM Cloud Object Storage bucket."
  default     = "[\"0.0.0.0/0\"]"
}

variable "workload_flow_log_bucket_activity_tracker_crn" {
  type        = string
  description = "The crn of the Activity Tracking instance"
  default     = null
}

variable "workload2_flow_log_bucket_activity_tracker_crn" {
  type        = string
  description = "The crn of the Activity Tracking instance"
  default     = null
}
variable "workload3_flow_log_bucket_activity_tracker_crn" {
  type        = string
  description = "The crn of the Activity Tracking instance"
  default     = null
}

variable "workload_flow_log_bucket_metrics_monitoring_crn" {
  type        = string
  description = "The crn of the Metrics Monitoring instance"
  default     = null
}
variable "workload2_flow_log_bucket_metrics_monitoring_crn" {
  type        = string
  description = "The crn of the Metrics Monitoring instance"
  default     = null
}
variable "workload3_flow_log_bucket_metrics_monitoring_crn" {
  type        = string
  description = "The crn of the Metrics Monitoring instance"
  default     = null
}
variable "workload_flow_log_bucket_provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}
variable "workload2_flow_log_bucket_provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}
variable "workload3_flow_log_bucket_provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}

variable "workload_flow_log_bucket_name" {
  type        = string
  description = "Name of the bucket"
  default     = ""
}
variable "workload2_flow_log_bucket_name" {
  type        = string
  description = "Name of the bucket"
  default     = ""
}
variable "workload3_flow_log_bucket_name" {
  type        = string
  description = "Name of the bucket"
  default     = ""
}

variable "workload_flow_log_bucket_label" {
  type        = string
  description = "Label used to build the bucket name of not provided."
  default     = "flow-logs"
}
variable "workload2_flow_log_bucket_label" {
  type        = string
  description = "Label used to build the bucket name of not provided."
  default     = "flow-logs2"
}
variable "workload3_flow_log_bucket_label" {
  type        = string
  description = "Label used to build the bucket name of not provided."
  default     = "flow-logs3"
}

variable "workload_flow_log_bucket_cross_region_location" {
  type        = string
  description = "The cross-region location of the bucket. This value is optional. Valid values are (us, eu, and ap). This value takes precedence over others if provided."
  default     = ""
}
variable "workload2_flow_log_bucket_cross_region_location" {
  type        = string
  description = "The cross-region location of the bucket. This value is optional. Valid values are (us, eu, and ap). This value takes precedence over others if provided."
  default     = ""
}
variable "workload3_flow_log_bucket_cross_region_location" {
  type        = string
  description = "The cross-region location of the bucket. This value is optional. Valid values are (us, eu, and ap). This value takes precedence over others if provided."
  default     = ""
}

variable "workload_flow_log_bucket_storage_class" {
  type        = string
  description = "Storage class of the bucket. Supported values are standard, vault, cold, flex, smart."
  default     = "standard"
}
variable "workload2_flow_log_bucket_storage_class" {
  type        = string
  description = "Storage class of the bucket. Supported values are standard, vault, cold, flex, smart."
  default     = "standard"
}
variable "workload3_flow_log_bucket_storage_class" {
  type        = string
  description = "Storage class of the bucket. Supported values are standard, vault, cold, flex, smart."
  default     = "standard"
}

variable "workload_flow_log_bucket_allowed_ip" {
  type        = string
  description = "A list of IPv4 or IPv6 addresses in CIDR notation that you want to allow access to your IBM Cloud Object Storage bucket."
  default     = "[\"0.0.0.0/0\"]"
}
variable "workload2_flow_log_bucket_allowed_ip" {
  type        = string
  description = "A list of IPv4 or IPv6 addresses in CIDR notation that you want to allow access to your IBM Cloud Object Storage bucket."
  default     = "[\"0.0.0.0/0\"]"
}
variable "workload3_flow_log_bucket_allowed_ip" {
  type        = string
  description = "A list of IPv4 or IPv6 addresses in CIDR notation that you want to allow access to your IBM Cloud Object Storage bucket."
  default     = "[\"0.0.0.0/0\"]"
}

variable "mgmt_ssh_vsi_name" {
  type        = string
  description = "(Optional) Name given to the ssh key instance. If not provided it will be generated using prefix_name"
  default     = ""
}

variable "mgmt_ssh_vsi_label" {
  type        = string
  description = "(Optional) Label used for the instance. It will be added to the name_prefix to create the name if the name is not provided."
  default     = "scc"
}

variable "mgmt_ssh_vsi_public_key" {
  type        = string
  description = "The public key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}

variable "mgmt_ssh_vsi_private_key" {

  type        = string
  description = "The private key provided for the ssh key. If empty string is provided then a new key will be generated."
  default = ""
}

variable "mgmt_ssh_vsi_public_key_file" {
  type        = string
  description = "The name of the file containing the public key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}

variable "mgmt_ssh_vsi_private_key_file" {
  type        = string
  description = "The name of the file containing the private key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}

variable "mgmt_ssh_vsi_rsa_bits" {
  type        = number
  description = "The number of bits for the rsa key, if it will be generated"
  default     = 3072
}

variable "workload_ssh_vsi_name" {
  type        = string
  description = "(Optional) Name given to the ssh key instance. If not provided it will be generated using prefix_name"
  default     = ""
}
variable "workload2_ssh_vsi_name" {
  type        = string
  description = "(Optional) Name given to the ssh key instance. If not provided it will be generated using prefix_name"
  default     = ""
}
variable "workload3_ssh_vsi_name" {
  type        = string
  description = "(Optional) Name given to the ssh key instance. If not provided it will be generated using prefix_name"
  default     = ""
}

variable "workload_ssh_vsi_label" {
  type        = string
  description = "(Optional) Label used for the instance. It will be added to the name_prefix to create the name if the name is not provided."
  default     = "vsi"
}
variable "workload2_ssh_vsi_label" {
  type        = string
  description = "(Optional) Label used for the instance. It will be added to the name_prefix to create the name if the name is not provided."
  default     = "vsi2"
}
variable "workload3_ssh_vsi_label" {
  type        = string
  description = "(Optional) Label used for the instance. It will be added to the name_prefix to create the name if the name is not provided."
  default     = "vsi3"
}

variable "workload_ssh_vsi_public_key" {
  type        = string
  description = "The public key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}
variable "workload2_ssh_vsi_public_key" {
  type        = string
  description = "The public key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}
variable "workload3_ssh_vsi_public_key" {
  type        = string
  description = "The public key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}

variable "workload_ssh_vsi_private_key" {
  type        = string
  description = "The private key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}
variable "workload2_ssh_vsi_private_key" {
  type        = string
  description = "The private key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}
variable "workload3_ssh_vsi_private_key" {
  type        = string
  description = "The private key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}

variable "workload_ssh_vsi_public_key_file" {
  type        = string
  description = "The name of the file containing the public key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}
variable "workload2_ssh_vsi_public_key_file" {
  type        = string
  description = "The name of the file containing the public key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}
variable "workload3_ssh_vsi_public_key_file" {
  type        = string
  description = "The name of the file containing the public key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}

variable "workload_ssh_vsi_private_key_file" {
  type        = string
  description = "The name of the file containing the private key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}
variable "workload2_ssh_vsi_private_key_file" {
  type        = string
  description = "The name of the file containing the private key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}
variable "workload3_ssh_vsi_private_key_file" {
  type        = string
  description = "The name of the file containing the private key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}

variable "workload_ssh_vsi_rsa_bits" {
  type        = number
  description = "The number of bits for the rsa key, if it will be generated"
  default     = 3072
}
variable "workload2_ssh_vsi_rsa_bits" {
  type        = number
  description = "The number of bits for the rsa key, if it will be generated"
  default     = 3072
}
variable "workload3_ssh_vsi_rsa_bits" {
  type        = number
  description = "The number of bits for the rsa key, if it will be generated"
  default     = 3072
}

# comment this variable when using custom prefixes in tfvars
variable "mgmt_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 3
}

variable "mgmt_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "mgmt"
}

variable "mgmt_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}

# comment this variable when using custom prefixes in tfvars
variable "mgmt_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.10.10.0/24\",\"10.20.10.0/24\",\"10.30.10.0/24\"]"
}

# comment this variable when using custom prefixes in tfvars
variable "mgmt_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}

variable "mgmt_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}

variable "mgmt_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}

# comment this variable when using custom prefixes in tfvars
variable "mgmt_vpe_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 3
}

variable "mgmt_vpe_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "vpe"
}

variable "mgmt_vpe_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}

# comment this variable when using custom prefixes in tfvars
variable "mgmt_vpe_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.10.20.0/24\",\"10.20.20.0/24\",\"10.30.20.0/24\"]"
}

# comment this variable when using custom prefixes in tfvars
variable "mgmt_vpe_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}

variable "mgmt_vpe_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}

variable "mgmt_vpe_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}

# comment this variable when using custom prefixes in tfvars
variable "mgmt_vpn_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 1
}

variable "mgmt_vpn_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "vpn"
}

variable "mgmt_vpn_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}

# comment this variable when using custom prefixes in tfvars
variable "mgmt_vpn_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.10.30.0/24\"]"
}

# comment this variable when using custom prefixes in tfvars
variable "mgmt_vpn_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}
variable "mgmt_vpn_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}

variable "mgmt_vpn_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = false
}

variable "mgmt_vpn_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}


# comment this variable when using custom prefixes in tfvars
variable "workload_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 3
}
variable "workload2_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 3
}
variable "workload3_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 3
}

variable "workload_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "workload"
}
variable "workload2_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "workload2"
}
variable "workload3_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "workload3"
}

variable "workload_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}
variable "workload2_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}
variable "workload3_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}

# comment this variable when using custom prefixes in tfvars
variable "workload_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.40.10.0/24\",\"10.50.10.0/24\",\"10.60.10.0/24\"]"
}
variable "workload2_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.70.10.0/24\",\"10.80.10.0/24\",\"10.90.10.0/24\"]"
}
variable "workload3_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.100.10.0/24\",\"10.110.10.0/24\",\"10.120.10.0/24\"]"
}

# comment this variable when using custom prefixes in tfvars
variable "workload_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}
variable "workload2_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}
variable "workload3_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}

variable "workload_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}
variable "workload2_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}
variable "workload3_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}
variable "workload_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}
variable "workload2_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}
variable "workload3_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}

# comment this variable when using custom prefixes in tfvars
variable "workload_vpe_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 3
}
variable "workload2_vpe_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 3
}
variable "workload3_vpe_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 3
}

variable "workload_vpe_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "vpe"
}
variable "workload2_vpe_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "vpe2"
}
variable "workload3_vpe_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "vpe3"
}

variable "workload_vpe_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}
variable "workload2_vpe_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}
variable "workload3_vpe_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}

# comment this variable when using custom prefixes in tfvars
variable "workload_vpe_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.40.20.0/24\",\"10.50.20.0/24\",\"10.60.20.0/24\"]"
}
variable "workload2_vpe_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.70.20.0/24\",\"10.80.20.0/24\",\"10.90.20.0/24\"]"
}
variable "workload3_vpe_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.100.20.0/24\",\"10.110.20.0/24\",\"10.120.20.0/24\"]"
}


# comment this variable when using custom prefixes in tfvars
variable "workload_vpe_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}
variable "workload2_vpe_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}
variable "workload3_vpe_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}

variable "workload_vpe_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}
variable "workload2_vpe_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}
variable "workload3_vpe_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}

variable "workload_vpe_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}
variable "workload2_vpe_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}
variable "workload3_vpe_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}

# comment this variable when using custom prefixes in tfvars
variable "workload_vpn_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 1
}
variable "workload2_vpn_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 1
}
variable "workload3_vpn_subnets__count" {
  type        = number
  description = "The number of subnets that should be provisioned"
  default     = 1
}

variable "workload_vpn_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "vpn"
}
variable "workload2_vpn_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "vpn2"
}
variable "workload3_vpn_subnets_label" {
  type        = string
  description = "Label for the subnets created"
  default     = "vpn3"
}

variable "workload_vpn_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}
variable "workload2_vpn_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}
variable "workload3_vpn_subnets_zone_offset" {
  type        = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default     = 0
}

# comment this variable when using custom prefixes in tfvars
variable "workload_vpn_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.40.30.0/24\"]"
}
variable "workload2_vpn_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.70.30.0/24\"]"
}
variable "workload3_vpn_subnets_ipv4_cidr_blocks" {
  type        = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = "[\"10.100.30.0/24\"]"
}


# comment this variable when using custom prefixes in tfvars
variable "workload_vpn_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}
variable "workload2_vpn_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}
variable "workload3_vpn_subnets_ipv4_address_count" {
  type        = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default     = 256
}
variable "workload_vpn_provision" {
  type        = bool
  description = "Flag indicating that the VPN should be provisioned. If 'false' then the subnet will be looked up."
  default     = false
}
variable "workload2_vpn_provision" {
  type        = bool
  description = "Flag indicating that the VPN should be provisioned. If 'false' then the subnet will be looked up."
  default     = false
}
variable "workload3_vpn_provision" {
  type        = bool
  description = "Flag indicating that the VPN should be provisioned. If 'false' then the subnet will be looked up."
  default     = false
}
variable "workload_vpn_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}
variable "workload2_vpn_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}
variable "workload3_vpn_subnets_provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}

variable "workload_vpn_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}
variable "workload2_vpn_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}
variable "workload3_vpn_subnets_acl_rules" {
  type        = string
  description = "List of rules to set on the subnet access control list"
  default     = "[]"
}

variable "kms_enabled" {
  type        = bool
  description = "kms key should be enabled"
  default     = true
}

variable "ibm_transit_gateway_name" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = ""
}

variable "mode" {
  type        = string
  description = "The optional mode of operation for the VPN gateway. Valid values are route or policy"
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "List of tags for the resource"
  default     = []
}

variable "mgmt_flow_log_auth_source_service_name" {
  type        = string
  description = "The name of the service that will be authorized to access the target service. This value is the name of the service as it appears in the service catalog."
  default     = "is"
}

variable "mgmt_flow_log_auth_source_resource_instance_id" {
  type        = string
  description = "The instance id of the source service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}

variable "mgmt_flow_log_auth_source_resource_type" {
  type        = string
  description = "The resource type of the source service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = "flow-log-collector"
}

variable "mgmt_flow_log_auth_source_resource_group_id" {
  type        = string
  description = "The id of the resource group that will be used to scope which source services will be authorized to access the target service. If not provided the authorization will be scoped to the entire account. This value is superseded by the source_resource_instance_id"
  default     = null
}

variable "mgmt_flow_log_auth_provision" {
  type        = bool
  description = "Flag indicating that the service authorization should be created"
  default     = true
}

variable "mgmt_flow_log_auth_target_service_name" {
  type        = string
  description = "The name of the service to which the source service will be authorization to access. This value is the name of the service as it appears in the service catalog."
  default     = "cloud-object-storage"
}

variable "mgmt_flow_log_auth_target_resource_instance_id" {
  type        = string
  description = "The instance id of the target service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}

variable "mgmt_flow_log_auth_target_resource_type" {
  type        = string
  description = "The resource type of the target service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}

variable "mgmt_flow_log_auth_roles" {
  type        = string
  description = "A list of roles that should be granted on the target service (e.g. Reader, Writer)."
  default     = "[\"Writer\"]"
}

variable "mgmt_flow_log_auth_source_service_account" {
  type        = string
  description = "GUID of the account where the source service is provisioned. This is required to authorize service access across accounts."
  default     = null
}

variable "workload_flow_log_auth_source_service_name" {
  type        = string
  description = "The name of the service that will be authorized to access the target service. This value is the name of the service as it appears in the service catalog."
  default     = "is"
}
variable "workload2_flow_log_auth_source_service_name" {
  type        = string
  description = "The name of the service that will be authorized to access the target service. This value is the name of the service as it appears in the service catalog."
  default     = "is"
}
variable "workload3_flow_log_auth_source_service_name" {
  type        = string
  description = "The name of the service that will be authorized to access the target service. This value is the name of the service as it appears in the service catalog."
  default     = "is"
}

variable "workload_flow_log_auth_source_resource_instance_id" {
  type        = string
  description = "The instance id of the source service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}
variable "workload2_flow_log_auth_source_resource_instance_id" {
  type        = string
  description = "The instance id of the source service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}
variable "workload3_flow_log_auth_source_resource_instance_id" {
  type        = string
  description = "The instance id of the source service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}

variable "workload_flow_log_auth_source_resource_type" {
  type        = string
  description = "The resource type of the source service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = "flow-log-collector"
}
variable "workload2_flow_log_auth_source_resource_type" {
  type        = string
  description = "The resource type of the source service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = "flow-log-collector"
}
variable "workload3_flow_log_auth_source_resource_type" {
  type        = string
  description = "The resource type of the source service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = "flow-log-collector"
}

variable "workload_flow_log_auth_source_resource_group_id" {
  type        = string
  description = "The id of the resource group that will be used to scope which source services will be authorized to access the target service. If not provided the authorization will be scoped to the entire account. This value is superseded by the source_resource_instance_id"
  default     = null
}
variable "workload2_flow_log_auth_source_resource_group_id" {
  type        = string
  description = "The id of the resource group that will be used to scope which source services will be authorized to access the target service. If not provided the authorization will be scoped to the entire account. This value is superseded by the source_resource_instance_id"
  default     = null
}
variable "workload3_flow_log_auth_source_resource_group_id" {
  type        = string
  description = "The id of the resource group that will be used to scope which source services will be authorized to access the target service. If not provided the authorization will be scoped to the entire account. This value is superseded by the source_resource_instance_id"
  default     = null
}

variable "workload_flow_log_auth_provision" {
  type        = bool
  description = "Flag indicating that the service authorization should be created"
  default     = false
}
variable "workload2_flow_log_auth_provision" {
  type        = bool
  description = "Flag indicating that the service authorization should be created"
  default     = false
}
variable "workload3_flow_log_auth_provision" {
  type        = bool
  description = "Flag indicating that the service authorization should be created"
  default     = false
}

variable "workload_flow_log_auth_target_service_name" {
  type        = string
  description = "The name of the service to which the source service will be authorization to access. This value is the name of the service as it appears in the service catalog."
  default     = "cloud-object-storage"
}
variable "workload2_flow_log_auth_target_service_name" {
  type        = string
  description = "The name of the service to which the source service will be authorization to access. This value is the name of the service as it appears in the service catalog."
  default     = "cloud-object-storage"
}
variable "workload3_flow_log_auth_target_service_name" {
  type        = string
  description = "The name of the service to which the source service will be authorization to access. This value is the name of the service as it appears in the service catalog."
  default     = "cloud-object-storage"
}

variable "workload_flow_log_auth_target_resource_instance_id" {
  type        = string
  description = "The instance id of the target service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}
variable "workload2_flow_log_auth_target_resource_instance_id" {
  type        = string
  description = "The instance id of the target service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}
variable "workload3_flow_log_auth_target_resource_instance_id" {
  type        = string
  description = "The instance id of the target service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}

variable "workload_flow_log_auth_target_resource_type" {
  type        = string
  description = "The resource type of the target service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}
variable "workload2_flow_log_auth_target_resource_type" {
  type        = string
  description = "The resource type of the target service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}
variable "workload3_flow_log_auth_target_resource_type" {
  type        = string
  description = "The resource type of the target service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}

variable "workload_flow_log_auth_roles" {
  type        = string
  description = "A list of roles that should be granted on the target service (e.g. Reader, Writer)."
  default     = "[\"Writer\"]"
}
variable "workload2_flow_log_auth_roles" {
  type        = string
  description = "A list of roles that should be granted on the target service (e.g. Reader, Writer)."
  default     = "[\"Writer\"]"
}
variable "workload3_flow_log_auth_roles" {
  type        = string
  description = "A list of roles that should be granted on the target service (e.g. Reader, Writer)."
  default     = "[\"Writer\"]"
}

variable "workload_flow_log_auth_source_service_account" {
  type        = string
  description = "GUID of the account where the source service is provisioned. This is required to authorize service access across accounts."
  default     = null
}
variable "workload2_flow_log_auth_source_service_account" {
  type        = string
  description = "GUID of the account where the source service is provisioned. This is required to authorize service access across accounts."
  default     = null
}
variable "workload3_flow_log_auth_source_service_account" {
  type        = string
  description = "GUID of the account where the source service is provisioned. This is required to authorize service access across accounts."
  default     = null
}

variable "workload_cos_auth_source_service_name" {
  type        = string
  description = "The name of the service that will be authorized to access the target service. This value is the name of the service as it appears in the service catalog."
  default     = "cloud-object-storage"
}
variable "workload2_cos_auth_source_service_name" {
  type        = string
  description = "The name of the service that will be authorized to access the target service. This value is the name of the service as it appears in the service catalog."
  default     = "cloud-object-storage"
}
variable "workload3_cos_auth_source_service_name" {
  type        = string
  description = "The name of the service that will be authorized to access the target service. This value is the name of the service as it appears in the service catalog."
  default     = "cloud-object-storage"
}

variable "workload_cos_auth_source_resource_instance_id" {
  type        = string
  description = "The instance id of the source service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}
variable "workload2_cos_auth_source_resource_instance_id" {
  type        = string
  description = "The instance id of the source service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}
variable "workload3_cos_auth_source_resource_instance_id" {
  type        = string
  description = "The instance id of the source service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}

variable "workload_cos_auth_source_resource_type" {
  type        = string
  description = "The resource type of the source service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}
variable "workload2_cos_auth_source_resource_type" {
  type        = string
  description = "The resource type of the source service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}
variable "workload3_cos_auth_source_resource_type" {
  type        = string
  description = "The resource type of the source service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}

variable "workload_cos_auth_source_resource_group_id" {
  type        = string
  description = "The id of the resource group that will be used to scope which source services will be authorized to access the target service. If not provided the authorization will be scoped to the entire account. This value is superseded by the source_resource_instance_id"
  default     = null
}
variable "workload2_cos_auth_source_resource_group_id" {
  type        = string
  description = "The id of the resource group that will be used to scope which source services will be authorized to access the target service. If not provided the authorization will be scoped to the entire account. This value is superseded by the source_resource_instance_id"
  default     = null
}
variable "workload3_cos_auth_source_resource_group_id" {
  type        = string
  description = "The id of the resource group that will be used to scope which source services will be authorized to access the target service. If not provided the authorization will be scoped to the entire account. This value is superseded by the source_resource_instance_id"
  default     = null
}
variable "workload_cos_auth_provision" {
  type        = bool
  description = "Flag indicating that the service authorization should be created"
  default     = false
}
variable "workload2_cos_auth_provision" {
  type        = bool
  description = "Flag indicating that the service authorization should be created"
  default     = false
}
variable "workload3_cos_auth_provision" {
  type        = bool
  description = "Flag indicating that the service authorization should be created"
  default     = false
}

variable "workload_cos_auth_target_service_name" {
  type        = string
  description = "The name of the service to which the source service will be authorization to access. This value is the name of the service as it appears in the service catalog."
  default     = "hs-crypto"
}
variable "workload2_cos_auth_target_service_name" {
  type        = string
  description = "The name of the service to which the source service will be authorization to access. This value is the name of the service as it appears in the service catalog."
  default     = "hs-crypto"
}
variable "workload3_cos_auth_target_service_name" {
  type        = string
  description = "The name of the service to which the source service will be authorization to access. This value is the name of the service as it appears in the service catalog."
  default     = "hs-crypto"
}

variable "workload_cos_auth_target_resource_instance_id" {
  type        = string
  description = "The instance id of the target service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}
variable "workload2_cos_auth_target_resource_instance_id" {
  type        = string
  description = "The instance id of the target service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}
variable "workload3_cos_auth_target_resource_instance_id" {
  type        = string
  description = "The instance id of the target service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}
variable "workload_cos_auth_target_resource_type" {
  type        = string
  description = "The resource type of the target service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}
variable "workload2_cos_auth_target_resource_type" {
  type        = string
  description = "The resource type of the target service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}
variable "workload3_cos_auth_target_resource_type" {
  type        = string
  description = "The resource type of the target service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}

variable "workload_cos_auth_roles" {
  type        = string
  description = "A list of roles that should be granted on the target service (e.g. Reader, Writer)."
  default     = "[\"Reader\"]"
}
variable "workload2_cos_auth_roles" {
  type        = string
  description = "A list of roles that should be granted on the target service (e.g. Reader, Writer)."
  default     = "[\"Reader\"]"
}
variable "workload3_cos_auth_roles" {
  type        = string
  description = "A list of roles that should be granted on the target service (e.g. Reader, Writer)."
  default     = "[\"Reader\"]"
}

variable "workload_cos_auth_source_service_account" {
  type        = string
  description = "GUID of the account where the source service is provisioned. This is required to authorize service access across accounts."
  default     = null
}
variable "workload2_cos_auth_source_service_account" {
  type        = string
  description = "GUID of the account where the source service is provisioned. This is required to authorize service access across accounts."
  default     = null
}
variable "workload3_cos_auth_source_service_account" {
  type        = string
  description = "GUID of the account where the source service is provisioned. This is required to authorize service access across accounts."
  default     = null
}

variable "mgmt_cos_auth_source_service_name" {
  type        = string
  description = "The name of the service that will be authorized to access the target service. This value is the name of the service as it appears in the service catalog."
  default     = "cloud-object-storage"
}

variable "mgmt_cos_auth_source_resource_instance_id" {
  type        = string
  description = "The instance id of the source service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}

variable "mgmt_cos_auth_source_resource_type" {
  type        = string
  description = "The resource type of the source service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}

variable "mgmt_cos_auth_source_resource_group_id" {
  type        = string
  description = "The id of the resource group that will be used to scope which source services will be authorized to access the target service. If not provided the authorization will be scoped to the entire account. This value is superseded by the source_resource_instance_id"
  default     = null
}

variable "mgmt_cos_auth_provision" {
  type        = bool
  description = "Flag indicating that the service authorization should be created"
  default     = true
}

variable "mgmt_cos_auth_target_resource_instance_id" {
  type        = string
  description = "The instance id of the target service. This value is required if the authorization will be scoped to a specific service instance. If not provided the authorization will be scoped to the resource group or the account."
  default     = null
}

variable "mgmt_cos_auth_target_resource_type" {
  type        = string
  description = "The resource type of the target service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector)."
  default     = null
}

variable "mgmt_cos_auth_roles" {
  type        = string
  description = "A list of roles that should be granted on the target service (e.g. Reader, Writer)."
  default     = "[\"Reader\"]"
}

variable "mgmt_cos_auth_source_service_account" {
  type        = string
  description = "GUID of the account where the source service is provisioned. This is required to authorize service access across accounts."
  default     = null
}

# VPC Load Balancer
variable "mgmt_lb_provision" {
  type        = bool
  description = "set true to create, false to skip"
  default     = true
}

variable "mgmt_lb_type" {
  description = "vpc load balancer type"
  type        = string
  default     = "private"
}

variable "workload_lb_provision" {
  type        = bool
  description = "set true to create, false to skip"
  default     = true
}
variable "workload2_lb_provision" {
  type        = bool
  description = "set true to create, false to skip"
  default     = true
}
variable "workload3_lb_provision" {
  type        = bool
  description = "set true to create, false to skip"
  default     = true
}

variable "workload_lb_type" {
  description = "vpc load balancer type"
  type        = string
  default     = "private"
}
variable "workload2_lb_type" {
  description = "vpc load balancer type"
  type        = string
  default     = "private"
}
variable "workload3_lb_type" {
  description = "vpc load balancer type"
  type        = string
  default     = "private"
}

# VPE for IBM Container Registry
variable "mgmt_vpe_containerregistry_crn" {
  type        = string
  description = "Container Registry CRN based on region"
  default     = "crn:v1:bluemix:public:container-registry:ca-tor:::endpoint:vpe.ca-tor.container-registry.cloud.ibm.com"
}
variable "workload_vpe_containerregistry_crn" {
  type        = string
  description = "Container Registry CRN based on region"
  default     = "crn:v1:bluemix:public:container-registry:ca-tor:::endpoint:vpe.ca-tor.container-registry.cloud.ibm.com"
}
variable "workload2_vpe_containerregistry_crn" {
  type        = string
  description = "Container Registry CRN based on region"
  default     = "crn:v1:bluemix:public:container-registry:ca-tor:::endpoint:vpe.ca-tor.container-registry.cloud.ibm.com"
}
variable "workload3_vpe_containerregistry_crn" {
  type        = string
  description = "Container Registry CRN based on region"
  default     = "crn:v1:bluemix:public:container-registry:ca-tor:::endpoint:vpe.ca-tor.container-registry.cloud.ibm.com"
}
variable "mgmt_vpc_vsi_image_name" {
  type        = string
  description = "OS image for management VPC VSI"
  default     = "ibm-ubuntu-18-04-5-minimal-amd64-1"
}
variable "workload_vpc_vsi_image_name" {
  type        = string
  description = "OS image for workload VPC VSI"
  default     = "ibm-ubuntu-18-04-5-minimal-amd64-1"
}
variable "workload2_vpc_vsi_image_name" {
  type        = string
  description = "OS image for workload VPC VSI"
  default     = "ibm-ubuntu-18-04-5-minimal-amd64-1"
}
variable "workload3_vpc_vsi_image_name" {
  type        = string
  description = "OS image for workload VPC VSI"
  default     = "ibm-ubuntu-18-04-5-minimal-amd64-1"
}
variable "workload_vsi_count" {
  type        = number
  description = "Number of VSI"
  default     = 3 
}
variable "workload2_vsi_count" {
  type        = number
  description = "Number of VSI"
  default     = 3 
}
variable "workload3_vsi_count" {
  type        = number
  description = "Number of VSI"
  default     = 3 
}
variable "logdna_plan" {
  type = string
  description = "The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day)"
  default = "7-day"
}
variable "logdna_tags" {
  type = string
  description = "Tags that should be applied to the service"
  default = "[]"
}
variable "logdna_provision" {
  type = bool
  description = "Flag indicating that logdna instance should be provisioned"
  default = true
}
variable "logdna_name" {
  type = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default = ""
}
variable "logdna_label" {
  type = string
  description = "The label used to build the resource name if not provided"
  default = "logging"
}
variable "sysdig_plan" {
  type = string
  description = "The type of plan the service instance should run under (trial or graduated-tier)"
  default = "graduated-tier"
}
variable "sysdig_tags" {
  type = string
  description = "Tags that should be applied to the service"
  default = "[]"
}
variable "sysdig_provision" {
  type = bool
  description = "Flag indicating that logdna instance should be provisioned"
  default = true
}
variable "sysdig_name" {
  type = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default = ""
}
variable "sysdig_label" {
  type = string
  description = "The label used to build the resource name if not provided."
  default = "monitoring"
}
variable "cs_name_prefix" {
  type = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
  default = "cs99"
}
variable "ibm-activity-tracker_tags" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "[]"
}
variable "ibm-activity-tracker_plan" {
  type = string
  description = "The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day)"
  default = "7-day"
}
variable "ibm-activity-tracker_provision" {
  type = bool
  description = "Flag indicating that the instance should be provisioned"
  default = true
}
variable "mgmt_vsi_count" {
  type        = number
  description = "Number of Mangement VSI"
  default     = 1 
}
