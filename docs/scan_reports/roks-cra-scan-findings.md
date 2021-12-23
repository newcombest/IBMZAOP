# CRA Scan Findings

| Controll ID | Result      | Test Clause  | Comment | Fix |
|-------------|-------------|---------|---------|-----|
|3000009 | N/A		        |         |         |      |
|3000010 | Passed           |         |         |      |
|3000011 |  N/A             |         |         |      |
|3000012 |   N/A            |         |         |      |
|3000013 |  N/A             |         |         |      |
|3000014 | N/A              |         |         |      |
|3000015 |  Passed          |         |         |      |
|3000016 |          N/A     |         |         |      |
|3000017 |       N/A        |         |         |      |
|3000018 |      N/A         |         |         |      |
|3000019 |       N/A        |         |         |      |
|3000020 |        N/A       |         |         |      |
|3000021 |        N/A       |         |         |      |
|3000022 |   Passed         |         |         |      |
|3000023 |     N/A          |         |         |      |
|3000024 |     N/A          |         |         |      |
|3000025 |      N/A         |         |         |      |
|3000026 |       N/A        |         |         |      |
|3000027 |       N/A        |         |         |      |
|3000028 | Passed           |         |         |      |
|3000029 | Passed           |         |         |      |
|3000030 |Passed            |         |         |      |
|3000031 | N/A              |         |         |      |
|3000032 | Passed           |         |         |      |
|3000033 | Passed           | Ensure IAM-enabled services have at least # users with the IAM manager role        | Passed when set to zero        |      |
|3000034 | Passed           | Ensure IAM-enabled services have at least # service IDs with the IAM manager role        | Passed when set to zero        |      |
|3000035 | Passed                 |         |         |      |
|3000038 | N/A                 |         |         |      |
|3000045 |    N/A              |         |         |      |
|3000101 |   Passed               |         |         |      |
|3000103 |   N/A               |         |         |      |
|3000104 |   N/A               |         |         |      |
|3000105 |   Passed               |         |         |      |
|3000106 |   Passed               |         |         |      |
|3000107 |   Passed               |         |         |      |
|3000108 |   Passed               |         |         |      |
|3000109 |   Passed               |         |         |      |
|3000114 |   Failed               | all_cos_bucket_should_have_activity_tracking_enabled        | Atracker does not validate in CRA        |      |
|3000115 | Failed                 | has_cloud_monitor_not_enabled_for_all_buckets        | Sysdig not an FS Cloud validated service        |      |
|3000116 | Failed                 | does_not_have_cos_bucket_enabled_for_cross_region_location        | Can be fixed in terraform if required        |      |
|3000204 | Passed                 |         |         |      |
|3000233 | Passed                 |         |         |      |
|3000234 | Passed                 |         |         |      |
|3000235 | Passed                 |         |         |      |
|3000250 | N/A                 |         |         |      |
|3000301 | Failed                 |         |         |      |
|3000303 | N/A                 |         |         |      |
|3000306 | Passed                 |         |         |      |
|3000307 | Passed                 |         |         |      |
|3000404 | Passed                 | vpc_allow_all_inbound_ssh        |         |      |
|3000405 | Passed           | vpc_allow_all_inbound_rdp         |        |      |
|3000406 | Passed                 |         |         |      |
|3000407 | unsupported                 |         |Virtual Private Cloud (VPC) has TLS v1.2 set for all inbound traffic through a load balancer         |      |
|3000408 | Failed           | has_vpcs_with_no_flow_log_enabled        | Flow log is enabled. Not sure why this is failing        |      |
|3000410 | Passed                 |         |         |      |
|3000411 | Passed                 |         |         |      |
|3000412 | Failed                 | vpc_sec_group_attached        | Sec group is attached, not sure why this is failing        |      |
|3000413 | Passed                 |         |         |      |
|3000414 | N/A                 |         |         |      |
|3000415 | N/A                 |         |         |      |
|3000416 | N/A                 |         |         |      |
|3000417| N/A                 |         |         |      |
|3000418| Failed             |does_not_have_vpn_provisioned_for_account        | VPN Gateway is deployed. Need ot check on this goal         |      |
|3000419| Passed                 |         |         |      |
|3000420| Passed                 |         |         |      |
|3000421| Passed                 |         |         |      |
|3000422| Passed                 |         |         |      |
|3000423| Passed                 |         |         |      |
|3000424| Passed                 |         |         |      |
|3000425| Passed                 |         |         |      |
|3000426| Passed                 |         |         |      |
|3000427| Passed                 |         |         |      |
|3000428| Passed                 |         |         |      |
|3000429| Passed                 |         |         |      |
|3000430| Passed                 |         |         |      |
|3000431| Passed                 |         |         |      |
|3000432| Passed                 |         |         |      |
|3000433| Passed                 |         |         |      |
|3000434|Passed                  |         |         |      |
|3000437|N/A                  |         |         |      |
|3000441|Passed                  |         |         |      |
|3000442|Passed                  |         |         |      |
|3000444|Passed                  |         |         |      |
|3000445|Failed                  | vpc_default_security_group_should_not_allow_SSH        | Due to ROKS - question asked on #armada-users        |      |
|3000446| Failed                 | vpc_default_security_group_should_not_allow_ping        | Due to ROKS - question asked on #armada-users        |      |
|3000447| Passed                 |         |         |      |
|3000448| unsupported                 |         |         |      |
|3000449| Passed                 |         |         |      |
|3000451| Failed                 | has_vpc_network_acl_with_incoming_traffic_to_any_port        | Due to ROKS - question asked on #armada-users        |      |
|3000452| Failed                  | has_vpc_network_acl_with_outgoing_traffic_to_any_port        |Due to ROKS - question asked on #armada-users         |      |
|3000453|Passed                  |         |         |      |
|3000454|Passed                  |         |         |      |
|3000455|Passed                  |         |         |      |
|3000456|Failed                  | has_vpc_defined_with_default_resource_group        |VPC is not in default resource group. Don't know why this fails         |      |
|3000458|Passed                  |         |         |      |
|3000460|Passed                  |         |         |      |
|3000462|Failed                  |vsi_for_vpc_has_an_invalid_custom_image         | Uses ubuntu. Need to check why this fails        |      |
|3000463|Passed                  |         |         |      |
|3000464|Passed                  |         |         |      |
|3000465|N/A                  |         |         |      |
|3000466|N/A                  |         |         |      |
|3000467|Passed                  |         |         |      |
|3000468|N/A                  |         |         |      |
|3000469|Passed                  |         |         |      |
|3000601| N/A                  |         |         |      |
|3000602| N/A                 |         |         |      |
|3000623| Passed                 |         |         |      |
|3000627| N/A                 |         |         |      |
|3000628| Passed                 |         |         |      |
|3000635| Passed                 |has_less_than_min_allowed_container_registry_managers         |Passed when set to zero         |      |
|3000636| Passed                 |has_less_than_min_allowed_container_registry_service_ids_managers         | Passed when set to zero        |      |
|3000639|N/A                  |         |         |      |
|3000701|N/A                  |         |         |      |
|3000702|N/A                  |         |         |      |
|3000703|N/A                  |         |         |      |
|3000704|N/A                  |         |         |      |
|3000705|N/A                  |         |         |      |
|3000706|N/A                  |         |         |      |
|3000707|N/A                  |         |         |      |
|3000708|N/A                  |         |         |      |
|3000709|N/A                  |         |         |      |
|3000710|N/A                  |         |         |      |
|3000711|N/A                  |         |         |      |
|3000712|N/A                  |         |         |      |
|3000713|N/A                  |         |         |      |
|3000714|N/A                  |         |         |      |
|3000715|N/A                  |         |         |      |
|3000716|N/A                  |         |         |      |
|3000717|N/A                  |         |         |      |
|3000718|N/A                  |         |         |      |
|3000719|N/A                  |         |         |      |
|3000720|N/A                  |         |         |      |
|3000723|N/A                  |         |         |      |
|3000724|N/A                  |         |         |      |
