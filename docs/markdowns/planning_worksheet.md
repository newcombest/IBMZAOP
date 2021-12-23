# Planning Worksheet

By default, subnets and IPs will be assigned but can be changed by editing the terraform templates.

The default CIDR prefixes for the Management and Workload VPCs are:

| Virtual Private Cloud (VPC) | Zone 1 | Zone 2 | Zone 3 |
| --- | --- | --- | --- |
| Management | 10.10.0.0/18 | 10.20.0.0/18 | 10.30.0.0/18 |
| Workload | 10.40.0.0/18 | 10.50.0.0/18 | 10.60.0.0/18 |

Management Resources Subnets:

| Management Resources Subnets | Zone 1 | Zone 2 | Zone 3 |
| --- | --- | --- | --- |
| mgmt 00, 01, 02 | 10.10.10.0/24 | 10.20.10.0/24 | 10.30.10.0/24 |
| vpe 00, 01, 02 | 10.10.20.0/24 | 10.20.20.0/24 | 10.30.20.0/24 |
| vpn 00 | 10.10.30.0/24 |  -  |  -  |

Workload Resources Subnets:

| Workload Resources Subnets | Zone 1 | Zone 2 | Zone 3 |
| --- | --- | --- | --- |
| wkld 00, 01, 02 | 10.40.10.0/24 | 10.50.10.0/24 | 10.60.10.0/24 |
| vpe 00, 01, 02 | 10.40.20.0/24 | 10.50.20.0/24 | 10.60.20.0/24 |
| vpn 00 | 10.40.30.0/24 |  -  |  -  |

mgmt: Management
wkld: Workload
vpe: Virtual Private Endpoints
vpn: Virtual Private Network

Local DNS will be available for name resolution using 161.26.0.7 and 161.26.0.8
