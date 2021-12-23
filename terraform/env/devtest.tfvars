####################################################################################################
#######Bootstrap Parameters#########################################################################
## Search for all items listed as "unique" and customize them to your environment
###################################################################################################
## The name of the resource group for bootstrap resources
## default: 
bootstrap_resource_group_name = "rg-boot-ca-tor-001"

## Should the recource group for bootstrap resources be provisioned
## default: false
bootstrap_resource_group_provision = false

## Should the COS instance for bootstrap be provisioned
## default: true
bootstrap_cos_provision = true

## The prefix for cos bootstrap
## default: 
bootstrap_cos_name_prefix = "cei"

## The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}
## default: cos
bootstrap_cos_label = "st-boot"

## The name for COS instance for bootstrap
## default: 
bootstrap_cos_name = "st-bootstrap01-a"

## Location of the bootstrap COS resources
## default: global
bootstrap_cos_location = "global"

## The type of plan the service instance should run under (lite or standard)
## default: standard
bootstrap_cos_plan = "standard"

## Tags that should be applied to the bootstrap cos service
## default: 
bootstrap_cos_tags = ""

## ##unique## The name of the COS bucket name for bootstrap(tfstate) ##unique##
## default: bootstrap
bootstrap_tfstate_bucket_name = "st-bootstraptfstate-a"

## ##unique## The name of the COS bucket name for bootstrap(kms) ##unique##
## default: bootstrap
bootstrap_hpcskey_bucket_name = "st-bootstrapbuckethpcs-a"

## Location of the bootstrap COS bucket
## default: us-south
bootstrap_cos_bucket_location = "ca-tor"

## The type of plan the service instance should run under (lite or standard)
## default: standard
bootstrap_cos_bucket_storage_class = "standard"

## Location of the key protect instance
## default: us-south
key_protect_region = "ca-tor"

## Name prefix of the key protect services
## default: 
key_protect_name_prefix = "kp-cei-ca-tor"

## The label that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}
## default: 
key_protect_label = "kpprod-a"

## The name of the key protect instance
## default:
key_protect_name = ""

## The type of plan the service instance should run under (lite or standard)
## default: tiered-pricing
key_protect_plan = "tiered-pricing"

## Should the key protect instance be provisioned
## default: true
key_protect_provision = true

## Location of the kms key 
## default: us-south
kms_key_region = "ca-tor"

## Name prefix of the key protect instance
## default: 
kms_key_name_prefix = "kp-cei-ca-tor-kpprod-a"

## The name of the key protect instance
## default:
kms_key_name = ""

## The label that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}
## default:
kms_key_label = "kms"

## Should the kms key be provisioned
## default: true
kms_key_provision = true

####################################################################################################
#######Provision Pattern parameters###########################################################################
## Search for all items listed as "unique" and customize them to your environment
###################################################################################################
#Pattern parameters
## The name of the resource group for common services
## default:
cs_resource_group_name = "rg-boot-ca-tor-001"

## Flag indicating that the resource group for common services should be created
## default: false
cs_resource_group_provision = false

## The name of the resource group for HPCS instance
## default: 
kms_resource_group_name = "rg-boot-ca-tor-001"

## Flag indicating that the resource group for HPCS instance should be created
## default: false
kms_resource_group_provision = false

## Geographic location of the HPCS instance (e.g. us-south, us-east)
## default:
kms_region = "ca-tor"

## Prefix name for the HPCS service. If not provided it will default to the resource group name
## default: 
kms_name_prefix = "kms-kp-ca-tor"

##The type of the service instance should run 'hpcs' or 'keyprotect'"
kms_service = "kms"

## The label that will be used to generate the name from the name_prefix.
## default: hpcs
kms_label = "hpcs"

## The name that should be used for the HPCS instance, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}
## default:
kms_name = "kp-cei-ca-tor-kpprod-a"

## Flag indicating that the service should be created with private endpoints
## default: true
kms_private_endpoint = "true"

## hpcs_plan:  The type of plan the service instance should run under (tiered-pricing)
## default: standard
kms_plan = "standard"

## hpcs_tags:  Tags that should be applied to the service
## default: []
kms_tags = "[]"

## hpcs_number_of_crypto_units: No of crypto units that has to be attached to the instance.
## default: 2
kms_number_of_crypto_units=2

## hpcs_provision: Flag indicating that hpcs instance should be provisioned. If 'false' then the instance is expected to already exist.
## default: false
kms_provision = false

##Enable if want HPCS automation
## Flag indicating that hpcs instance should be provisioned. If 'false' then the instance is expected to already exist.
## default: 
##hpcs_initialize =false

## Path to which tke files has to be exported.
## default: ""
##tke_files_path = ""

## First admin name for hpcs initialization
## default: ""
##admin1_name = "admin1"

## First admin password for hpcs initialization
## default: ""
##admin1_password = "admin123"

## Second admin name for hpcs initialization
## default: ""
##admin2_name = "admin2"

## Second admin password for hpcs initialization
## default: ""
##admin2_password = "admin438"

## Number of admins to manage HPCS
## default: 2
##admin_num = 2

## Threshold value
## default: 2
##threshold_value = 2

## Remove / delete threshold value
## default: 2
##rev_threshold_value = 2

## COS instance CRN
## default: 
##cos_crn = ""

##  COS endpoint
## default:""
##endpoint = "s3.us-south.cloud-object-storage.appdomain.cloud"

## COS bucket name for storing tke-files
## default:""
##bucket_name = "bootstrap-bucket-hpcs"

## The network access policy to apply to your Hyper Protect Crypto Services instance. Acceptable values are public-and-private or private-only.After the network access policy is set to private-only, you cannot access your instance from the public network and cannot view or manage keys through the UI. However, you can still adjust the network setting later using the API or CLI
## default: public-and-private
##allowed_network_type = "public-and-private"

## HPCS instance service port number
## default: 
##hpcs_port = "11705"

## Dual auth deletion policy enabled or not
## default: 
##dual_auth_delete = true
##End: Enable if want HPCS automation

## Geographic location of the resource (e.g. us-south, us-east)
## default: 
region = "ca-tor"

## The name of the resource group for management resources
## default:
mgmt_resource_group_name = "rg-boot-ca-tor-001"

## unique ## The name of the resource group for management resources ## unique ##
## default:
mgmt_kms_key_name = "key-cei-ca-tor-002"

## Flag indicating that the resource group for management resources should be created
## default: false
mgmt_resource_group_provision = false

## Geographic location of the COS instance for management resource (e.g. us-south, us-east)
## default: global
mgmt_cos_resource_location = "global"

## Tags that should be applied to the service
## default: []
mgmt_cos_tags = "[]"

## The type of plan the service instance should run under (lite or standard)
## default: standard
mgmt_cos_plan = "standard"

## Flag indicating that COS instance for management should be provisioned
## default: true
mgmt_cos_provision = true

## ##unique## The label that should be used for the service, particularly when connecting to an existing service.  ##unique##
## default: cos 
mgmt_cos_label = "st-mgmtcator-03"

## ## unique ## The prefix of the management resources ## unique ##
## default: devmgmt
mgmt_name_prefix = "mgmt-ca-tor-03"

## The name required for management VPC instance
## default:
management_vpc_name = "vpc-mgmt-ca-tor-02"

## Flag indicating that the VPN for workload VPC should be created
## default: true
mgmt_vpn_provision = true

## The number of VSI's that should be provisioned within Management VPC
## default: 0
mgmt_vsi_count = 1

## Flag indicating that the management VPC instance should be provisioned. If false then an existing instance will be looked up
## default: true
management_vpc_provision = true

## The number of ipv4_cidr_blocks.
## default: 3
management_vpc_address_prefix_count = 3
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the address prefixes. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.10.0.0/18\",\"10.20.0.0/18\",\"10.30.0.0/18\"]"
management_vpc_address_prefixes = "[\"10.124.59.0/24\",\"10.124.60.0/24\",\"10.124.61.0/24\"]"
## uncomment when changing to custom prefixes

##  Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up.
## default: true
mgmt_subnets_provision=true

## The number of subnets that should be provisioned
## default: 3
mgmt_subnets__count = 3
## uncomment when changing to custom prefixes

## Label for the subnets created
## default: mgmt
mgmt_subnets_label = "snet-mgmt-ca-tor-02"

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
mgmt_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.10.10.0/24\",\"10.20.10.0/24\",\"10.30.10.0/24\"]"
mgmt_subnets_ipv4_cidr_blocks = "[\"10.124.59.0/26\",\"10.124.60.0/26\",\"10.124.61.0/26\"]"
## uncomment when changing to custom prefixes

## The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
mgmt_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

## List of rules to be set on the subnet access control list
## mgmt_subnets_acl_rules = "[{\"name\":\"ingress-all\",\"action\":\"allow\",\"direction\":\"inbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"},{\"name\":\"egress-all\",\"action\":\"allow\",\"direction\":\"outbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"}]"
## Uncomment when allowing ingress and egress traffic from open internet
## default defined for inbound and outbound "allow" for 10.0.0.0/8 prefix on ports 80(http), 443(https), 53(DNS) and any port with highest priority in the same order respectively.

## The number of subnets that should be provisioned
## default: 3
mgmt_vpe_subnets__count = 3
## uncomment when changing to custom prefixes

## Label for the subnets created
## default: vpe
mgmt_vpe_subnets_label = "vpe-mgmt-ca-tor-02"

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
mgmt_vpe_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.10.20.0/24\",\"10.20.20.0/24\",\"10.30.20.0/24\"]"
mgmt_vpe_subnets_ipv4_cidr_blocks = "[\"10.124.59.64/26\",\"10.124.60.64/26\",\"10.124.61.64/26\"]"
## uncomment when changing to custom prefixes

## The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
mgmt_vpe_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

## Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up.
## default: true
mgmt_vpe_subnets_provision = true

## List of rules to be set on the subnet access control list
## mgmt_vpe_subnets_acl_rules = "[{\"name\":\"ingress-all\",\"action\":\"allow\",\"direction\":\"inbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"},{\"name\":\"egress-all\",\"action\":\"allow\",\"direction\":\"outbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"}]"
## Uncomment when allowing ingress and egress traffic from open internet
## default defined for inbound and outbound "allow" for 10.0.0.0/8 prefix on ports 80(http), 443(https), 53(DNS) and any port with highest priority in the same order respectively.

## The number of subnets that should be provisioned
## default: 1
mgmt_vpn_subnets__count = 1
## uncomment when changing to custom prefixes

## Label for the subnets created
## default: vpn
mgmt_vpn_subnets_label = "vpn-mgmt-ca-tor-02"

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
mgmt_vpn_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.10.30.0/24\"]"
mgmt_vpn_subnets_ipv4_cidr_blocks = "[\"10.124.59.128/26\"]"
## uncomment when changing to custom prefixes

##  The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
mgmt_vpn_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

##  Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up.
## default: true
mgmt_vpn_subnets_provision = true

## List of rules to be set on the subnet access control list
## mgmt_vpn_subnets_acl_rules = "[{\"name\":\"ingress-all\",\"action\":\"allow\",\"direction\":\"inbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"},{\"name\":\"egress-all\",\"action\":\"allow\",\"direction\":\"outbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"}]"
## Uncomment when allowing ingress and egress traffic from open internet
## default defined for inbound and outbound "allow" for 10.0.0.0/8 prefix on ports 80(http), 443(https), 53(DNS) and any port with highest priority in the same order respectively.


## The name of the resource group for workload resources
## default:
workload_resource_group_name = "rg-boot-ca-tor-001"
workload2_resource_group_name = "rg-boot-ca-tor-001"
workload3_resource_group_name = "rg-boot-ca-tor-001"


## Flag indicating that the resource group for workload resources should be created
## default: false
workload_resource_group_provision = false
workload2_resource_group_provision = false
workload3_resource_group_provision = false

## Geographic location of COS instance for workload resource (e.g. us-south, us-east)
## default: global
workload_cos_resource_location = "global"
workload2_cos_resource_location = "global"
workload3_cos_resource_location = "global"

####unique## Workload unique Bucket name ##unique##
## default:
workload_flow_log_bucket_name = "bkwklogcator-11"
workload2_flow_log_bucket_name = "bkwklogcator-12"
workload3_flow_log_bucket_name = "bkwklogcator-13"

## Tags that should be applied to the service
## default: []
workload_cos_tags = "[]"
workload2_cos_tags = "[]"
workload3_cos_tags = "[]"

## The type of plan the service instance should run under (lite or standard)
## default: standard
workload_cos_plan = "standard"
workload2_cos_plan = "standard"
workload3_cos_plan = "standard"

## Flag indicating that COS instance for workload should be provisioned
## default: true
workload_cos_provision = true
workload2_cos_provision = true
workload3_cos_provision = true

## ##unique## The label that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}
## default: cos ##unique##
workload_cos_label = "st-wkcsablecator-03"
workload2_cos_label = "st-wkdevcator-03"
workload3_cos_label = "st-wkprodcator-03"

## The name required for workload VPC instance
## La numerotation des VM est géré via le script sous le format 000
## default: 
workload_vpc_name = "vm-wkcsable"
workload2_vpc_name = "vm-wkdev"
workload3_vpc_name = "vm-wkprod"

## ## unique## The prefix of the workload resources ## unique ##
workload_name_prefix = "wl-csable-03"
workload2_name_prefix = "wl-dev-03"
workload3_name_prefix = "wl-prod-03"

## Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up
## default: true
workload_vpc_provision = true
workload2_vpc_provision = true
workload3_vpc_provision = true

##
## workload -- csable
##

## The number of ipv4_cidr_blocks
## default: 3
workload_vpc_address_prefix_count = 3
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the address prefixes. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.0.0/18\",\"10.50.0.0/18\",\"10.60.0.0/18\"]"
workload_vpc_address_prefixes = "[\"10.124.56.0/24\",\"10.124.57.0/24\",\"10.124.58.0/24\"]"
## uncomment when changing to custom prefixes

## The number of subnets that should be provisioned
## default: 3
workload_subnets__count = 3
## uncomment when changing to custom prefixes

##
## workload2 -- dev
##

## The number of ipv4_cidr_blocks
## default: 3
workload2_vpc_address_prefix_count = 3
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the address prefixes. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.0.0/18\",\"10.50.0.0/18\",\"10.60.0.0/18\"]"
workload2_vpc_address_prefixes = "[\"10.124.44.0/22\",\"10.124.48.0/22\",\"10.124.52.0/22\"]"
## uncomment when changing to custom prefixes

## The number of subnets that should be provisioned
## default: 3
workload2_subnets__count = 3
## uncomment when changing to custom prefixes

##
## workload3 -- prod
##

## The number of ipv4_cidr_blocks
## default: 3
workload3_vpc_address_prefix_count = 3
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the address prefixes. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.0.0/18\",\"10.50.0.0/18\",\"10.60.0.0/18\"]"
workload3_vpc_address_prefixes = "[\"10.124.32.0/22\",\"10.124.36.0/22\",\"10.124.40.0/22\"]"
## uncomment when changing to custom prefixes

## The number of subnets that should be provisioned
## default: 3
workload3_subnets__count = 3
## uncomment when changing to custom prefixes

## Label for the subnets created
## default: workload
workload_subnets_label = "snet-csable-02"
workload2_subnets_label = "snet-dev-02"
workload3_subnets_label = "snet-prod-02"

##
## workload -- csable
##

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
workload_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.10.0/24\",\"10.50.10.0/24\",\"10.60.10.0/24\"]"
workload_subnets_ipv4_cidr_blocks = "[\"10.124.56.0/26\",\"10.124.57.0/26\",\"10.124.58.0/26\"]"
## uncomment when changing to custom prefixes

## The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
workload_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

##
## workload2 -- dev
##

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
workload2_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.10.0/24\",\"10.50.10.0/24\",\"10.60.10.0/24\"]"
workload2_subnets_ipv4_cidr_blocks = "[\"10.124.44.0/26\",\"10.124.48.0/26\",\"10.124.52.0/26\"]"
## uncomment when changing to custom prefixes

## The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
workload2_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

##
## workload3 -- prod
##

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
workload3_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.10.0/24\",\"10.50.10.0/24\",\"10.60.10.0/24\"]"
workload3_subnets_ipv4_cidr_blocks = "[\"10.124.32.0/26\",\"10.124.36.0/26\",\"10.124.40.0/26\"]"
## uncomment when changing to custom prefixes

## The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
workload3_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

## Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up.
## default: true
workload_subnets_provision = true
workload2_subnets_provision = true
workload3_subnets_provision = true

## List of rules to be set on the subnet access control list
## workload_subnets_acl_rules = "[{\"name\":\"ingress-all\",\"action\":\"allow\",\"direction\":\"inbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"},{\"name\":\"egress-all\",\"action\":\"allow\",\"direction\":\"outbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"}]"
## Uncomment when allowing ingress and egress traffic from open internet
## default defined for inbound and outbound "allow" for 10.0.0.0/8 prefix on ports 80(http), 443(https), 53(DNS) and any port with highest priority in the same order respectively.

## The number of subnets that should be provisioned
## default: 3
workload_vpe_subnets__count = 3
## uncomment when changing to custom prefixes

## Label for the subnets created
## default: vpe
workload_vpe_subnets_label = "vpe-csable-02"
workload2_vpe_subnets_label = "vpe-dev-02"
workload3_vpe_subnets_label = "vpe-prod-02"

##
## workload -- csable
##

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
workload_vpe_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.20.0/24\",\"10.50.20.0/24\",\"10.60.20.0/24\"]"
workload_vpe_subnets_ipv4_cidr_blocks = "[\"10.124.56.64/26\",\"10.124.57.64/26\",\"10.124.58.64/26\"]"
## uncomment when changing to custom prefixes

## The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
workload_vpe_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

##
## workload2 -- dev
##

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
workload2_vpe_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.20.0/24\",\"10.50.20.0/24\",\"10.60.20.0/24\"]"
workload2_vpe_subnets_ipv4_cidr_blocks = "[\"10.124.44.64/26\",\"10.124.48.64/26\",\"10.124.52.64/26\"]"
## uncomment when changing to custom prefixes

## The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
workload2_vpe_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

##
## workload3 -- prod
##

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
workload3_vpe_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.20.0/24\",\"10.50.20.0/24\",\"10.60.20.0/24\"]"
workload3_vpe_subnets_ipv4_cidr_blocks = "[\"10.124.32.64/26\",\"10.124.36.64/26\",\"10.124.40.64/26\"]"
## uncomment when changing to custom prefixes

## The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
workload3_vpe_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

## Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up.
## default: true
workload_vpe_subnets_provision = true
workload2_vpe_subnets_provision = true
workload3_vpe_subnets_provision = true

## List of rules to be set on the subnet access control list
## workload_vpe_subnets_acl_rules = "[{\"name\":\"ingress-all\",\"action\":\"allow\",\"direction\":\"inbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"},{\"name\":\"egress-all\",\"action\":\"allow\",\"direction\":\"outbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"}]"
## Uncomment when allowing ingress and egress traffic from open internet
## default defined for inbound and outbound "allow" for 10.0.0.0/8 prefix on ports 80(http), 443(https), 53(DNS) and any port with highest priority in the same order respectively.

## The number of subnets that should be provisioned
## default: 1
workload_vpn_subnets__count = 1
## uncomment when changing to custom prefixes


## Label for the subnets created
## default: vpn
workload_vpn_subnets_label = "vpn-csable-02"
workload2_vpn_subnets_label = "vpn-dev-02"
workload3_vpn_subnets_label = "vpn-prod-02"

##
## workload -- csable
##

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
workload_vpn_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.30.0/24\"]"
workload_vpn_subnets_ipv4_cidr_blocks = "[\"10.124.56.128/26\"]"
## uncomment when changing to custom prefixes

## The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
workload_vpn_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

##
## workload2 -- dev
##

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
workload2_vpn_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.30.0/24\"]"
workload2_vpn_subnets_ipv4_cidr_blocks = "[\"10.124.44.128/26\"]"
## uncomment when changing to custom prefixes

## The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
workload2_vpn_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

##
## workload3 -- prod
##

## The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1
## default: 0
workload3_vpn_subnets_zone_offset = 0
## uncomment when changing to custom prefixes

## List of ipv4 cidr blocks for the subnets that will be created. If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value.
## default: "[\"10.40.30.0/24\"]"
workload3_vpn_subnets_ipv4_cidr_blocks = "[\"10.124.32.128/26\"]"
## uncomment when changing to custom prefixes

## The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored.
## default: 256
workload3_vpn_subnets_ipv4_address_count = 64
## uncomment when changing to custom prefixes

## Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up.
## default: true
workload_vpn_subnets_provision = true
workload2_vpn_subnets_provision = true
workload3_vpn_subnets_provision = true

## List of rules to be set on the subnet access control list
## workload_vpn_subnets_acl_rules = "[{\"name\":\"ingress-all\",\"action\":\"allow\",\"direction\":\"inbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"},{\"name\":\"egress-all\",\"action\":\"allow\",\"direction\":\"outbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"}]"
## Uncomment when allowing ingress and egress traffic from open internet
## default defined for inbound and outbound "allow" for 10.0.0.0/8 prefix on ports 80(http), 443(https), 53(DNS) and any port with highest priority in the same order respectively.

## Number of VSI to be provisoned in workload VPC
## default: 3
workload_vsi_count = 1
workload2_vsi_count = 1
workload3_vsi_count = 1

## Image name for Mangement & Workload VPC VSI
mgmt_vpc_vsi_image_name = "ibm-ubuntu-18-04-5-minimal-amd64-1"
workload_vpc_vsi_image_name = "ibm-ubuntu-18-04-5-minimal-amd64-1"
workload2_vpc_vsi_image_name = "ibm-ubuntu-18-04-5-minimal-amd64-1"
workload3_vpc_vsi_image_name = "ibm-ubuntu-18-04-5-minimal-amd64-1"

##########################
##!TRANSIT GATEWAY########
##########################

## name of transit gateway
## default: 
ibm_transit_gateway_name = "tg-cei-ca-tor-02"


##########################
####!LOAD BALANCERS#######
##########################

#Pattern Extension Parameters
## set true to create, false to skip the provision of load balancer for management resources
## default: true
mgmt_load_balancer_provision = true

## set true to create, false to skip the provision of load balancer for management resources
## default: true
workload_load_balancer_provision= true
workload2_load_balancer_provision= false
workload3_load_balancer_provision= false

## Name for management load balancer 
## default: mgmtloadbalancer
mgmt_load_balancer_name = "lb-cei-ca-tor-02"

## Name of workload load balancer 
## default: wrkloadbalancer
workload_load_balancer_name = "lb-csable-02"
workload2_load_balancer_name = "lb-dev-02"
workload3_load_balancer_name = "lb-prod-02"

## The type for nlb : public/private
## default: "private"
type = "private"

## The profile to use for this load balancer. Conflicts with 'logging'
## default: null
profile = null

## List of Tags for the Load Balancer
## default: 
lb_tags = []

##########################
####!OBSERVABILITY########
##########################
## Sysdig  - Install SysDig on Instance
##default:
sysdig_provision = true
## Name to use for Sysdig Instance 
sysdig_name = "sysdig-ca-tor-02"
## List of Tags for the Sysdig Instance
sysdig_tags = "[]"

##LogDNA - Install LogDNA on Instance
##default:
logdna_provision = true
## Name to use for LogDNA Instance 
logdna_name = "logdna-ca-tor-02"
## List of Tags for the LogDNA Instance
logdna_tags = "[]"

## Flag indicating that the service Activity Tracker should be created
## default: false
ibm-activity-tracker_provision = true 
## List of Tags for the Activity Tracker Instance
ibm-activity-tracker_tags = "[]"

##########################
#######SECURITY###########
##########################
resource_group_name = "rg-boot-ca-tor-02"
name_prefix = "cei"
plan = "standard"
