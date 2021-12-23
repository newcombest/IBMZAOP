# SCC Scan Findings 


| Controll ID | Result      | Rule Text | Comment | Fix |
|-------------|-------------|--------------|---------|----------|
|3000009 |Passed 		    |               |         |           |
|3000010 | Passed           |         |         |      |
|3000011 |Passed              |         |         |      |
|3000012 |Failed           |MFA should be enabled for all users  | Performed on user account and failed on all other accounts         |Doc - account setup      |
|3000013 |Passed            |         |         |      |
|3000014 |Failed             |Contact phone number should be defined         |         | Doc - account setup     |
|3000015 |Failed          |IAM users and service IDs are attached to access groups         |IAM users should be attached to at least one access group but verified that users are in mutliple "ag" but still failed         |Doc - account setup       |
|3000016 |Failed       |Policy for users are neither attached to access groups or roles, but found attached to an IAM user  |Discussion going on scc-questions channel |Doc - account setup       |
|3000017 | Failed           |MFA should be enabled at the account level         | Undefined        |    |
|3000018 | Passed        |MFA should be enabled by the account owner          | Undefined        |Doc - account setup       |
|3000019 | Failed        |Security questions are registered by the account owner          |Null         |Doc - account setup |
|3000020 | Failed        |Allowed IP addresses should be configured for the account         |         |      |
|3000021 |Failed        | No more than 10 admins should be allowed per account         |         |Doc - account setup       |
|3000022 |   Passed      |         |         |      |
|3000023 |Passed         |         |         |      |
|3000024 | Passed        |         |         |      |
|3000025 | Unable to perform        |account owner has logged in to IBM Cloud in the past # days (30 days) ///Activity Tracker  |Can't get details as Activity Tracker is disabled  |Doc - account setup       |
|3000026 | Failed       |user list visibility restrictions are configured in IAM settings for the account owner |  |Doc - account setup       |
|3000027 | Failed        | permissions for API key creation are limited and configured in IAM settings for the account owner    |You are not authorized to use this API         |Doc - account setup       |
|3000028 | Failed          | permissions for service ID creation are limited and configured in IAM settings for the account owner    |You are not authorized to use this API         |Doc - account setup       |
|3000029 | Failed          |IAM-enabled services have no more than # users with the IAM administrator role (3)  |157 users with the IAM administrator role are defined  |Doc - account setup       |
|3000030 |Failed           |Policy for service IDs are neither attached to access groups or roles, but found attached to an IAM user         |Discussion going on scc-questions channel |Doc - account setup       |
|3000031 |Unable to Perform   | Identity and Access Management (IAM) is enabled with audit logging         |Can't get details as Activity Tracker is disabled |Doc - account setup       |
|3000032 | Passed           |         |         |      |
|3000033 | Passed           |     |        |      |
|3000034 | Failed           |0 service IDs with the IAM manager role are defined        | No service ID's with manager role present        |      |
|3000035 | Failed                 |account access is managed only by IAM access groups         |IBMid-66100212J9//Account access is not managed only by IAM access groups |Doc - account setup       |
|3000038 | Passed               |         |         |      |
|3000045 | Failed             |Financial services validated account flag is not enabled in account settings   |         |Doc - account setup       |
|3000101 |   Passed               |         |         |      |
|3000103 | Passed              |         |         |      |
|3000104 |   N/A               |Cloudant is accessible only through HTTPS         |         |      |
|3000105 | Failed              |Cloud Object Storage is accessible only by using private endpoints         |failed on flow logs, mgmt and workload         | Should be looked into     |
|3000106 |   Passed               |         |         |      |
|3000107 | Failed              |Cloud Object Storage network access is restricted to a specific IP range         |Bootstrap buckets failed as network access is not restricted to specific IP range///flow logs buckets passed as we have specified and IP range |Bootstrap buckets -- I think this cannot be fixed because these buckets need to be accessed from toolchain      |
|3000108 | Failed              |Cloud Object Storage is enabled with customer-managed encryption and Keep Your Own Key (KYOK)|Bootstrap buckets failed as do not belong to Hyper Protect Crypto Services///flow logs buckets passed|Bootstrap buckets -- I think this cannot be fixed because these buckets need to be accessed from toolchain      |
|3000109 | Failed              | Cloudant has no more than # users with the IAM administrator role         |         |Should not have been triggered. Reported to SCC. Not part of FS 0.1?      |
|3000114 | Failed              |Cloud Object Storage buckets should be enabled with IBM Activity Tracker     |        |Doc - account setup   Link COS bucket to atracker      |
|3000115 | Failed                 |Cloud Object Storage buckets are enabled with IBM Cloud Monitoring       |       |No Action      |
|3000116 | Failed   |Cloud Object Storage bucket resiliency is set to cross region      |      |No Action      |
|3000204 | N/A    | Databases for MongoDB is accessible only by using private endpoints         |Valid, no databases   |      |
|3000233 | Passed    |         |         |      |
|3000234 | Failed    |Hyper Protect Crypto Services instance is enabled with a dual authorization deletion policy         |Hyper Protect Crypto Services instance is not enabled with a dual authorization deletion policy on 4 key's|Doc - HPCS setup |
|3000235 | Passed                 |Hyper Protect Crypto Services encryption keys should have an automatic rotation policy that is set to at least # months (Allowed 1 to 12) Resource ID         |Passed on vsi pattern keys/failed on 2 keys out of scope of vsi pattern         |Calling this Passed      |
|3000250 | Passed                 |         |         |      |
|3000301 | N/A    | IBM Activity Tracker is provisioned in multiple regions in an account (IBM / XaaS / IBM LogDNA / IBM LogDNA)         |Activity Tracker is disabled |SCC fix      |
|3000303 | N/A    |IBM Activity Tracker logs are encrypted at rest         |         |      |
|3000306 | Unable to perform   |Event Streams is accessible only by using private endpoints  |Event steams details not found |Reported to SCC. This should be N/A      |
|3000307 | Unable to perform                |Event streams instance should be configured with an allowlist for IP addresses |Event steams details not found|Reported to SCC. This should be N/A      |
|3000404 | Failed                 |        |        |      |
|3000405 | Failed                |          |         |      |
|3000406 | Failed                 |The default security group of every VPC restricts all traffic         |failed on mgmt and workload vpc         |Should be looked into      |
|3000407 | Failed                |         |         |      |
|3000408 | Passed                 |       |       |      |
|3000410 | Failed                 |         |         |      |
|3000411 | Failed                 |Security groups should not have outbound ports open to internet (0.0.0.0/0)         |failed on sg's attached on mgmt and workload vpc         |      |
|3000412 | Passed                |VM has at least one security group attached, -         |unable to perform on linux host. passed on mgmt vpc         |      |
|3000413 | Passed                 |All network interfaces of a VM have at least one security group attached         |unable to perform on linux host. passed on mgmt vpc         |      |
|3000414 | N/A  |Direct Link (2.0) allows no cross account connection approvals at the account level         |         |      |
|3000415 | N/A    |Direct Link (2.0) allows no cross account connection requests at the account level         |         |      |
|3000416 | Passed                 |         |         |      |
|3000417| Passed                 |         |         |      |
|3000418| Passed            |At least one VPN should be configured for the account         |Passed as the VPN's are deployed           |      |
|3000419| Unable to perform                 |VPN for VPC has Internet Key Exchange (IKE) policy encryption that is not set to "triple_des"         |Could not find the VPN gateways connections details |SCC fix      |
|3000420| Unable to perform                  |VPN for VPC has Internet Key Exchange (IKE) policy authentication that is set to "sha256"         |Could not find the VPN gateways connections details |SCC fix      |
|3000421| Unable to perform                  |VPN for VPC has a Diffie-Hellman group set to at least group # (14)         |Could not find the VPN gateways connections details|SCC fix      |
|3000422| Unable to perform                  |VPN for VPC has IPsec policy encryption that is not set to "triple_des"         |Could not find the VPN gateways connections details|SCC fix      |
|3000423| Unable to perform                  |VPN for VPC has IPsec policy authentication that is set to "sha256"          |Could not find the VPN gateways connections details|SCC fix      |
|3000424| Unable to perform      |VPN for VPC has an IPsec policy that does not have Perfect Forward Secrecy (PFS) disabled    |Could not find the VPN gateways connections details|SCC fix      |
|3000425| Unable to perform                 |VPN for VPC authentication is configured with a strong pre-shared key with at least 24 alphanumeric characters         | Could not find the VPN gateways connections details|SCC fix      |
|3000426| Unable to perform    |VPN for VPC has a Dead Peer Detection policy that is set to "restart"         |Could not find the VPN gateways connections details |SCC fix      |
|3000427| Passed                 |         |         |      |
|3000428| Failed                 |VPC load balancer should be configured with multiple members in the pool          |no pool member of mgmt and workload vpc       |      |
|3000429| Passed                 |         |         |      |
|3000430| Passed                 |         |         |      |
|3000431| Passed                 |         |         |      |
|3000432| Failed                 |         |         |      |
|3000433| Failed                 |         |         |      |
|3000434|Failed                  |         |         |      |
|3000437|N/A    |Block Storage for VPC is enabled with customer-managed encryption and Keep Your Own Key (KYO         |failed on mgmt and worklod vsi servers boot volume         |   |
|3000441|Failed                 |Virtual Private Cloud (VPC) network access control lists don't allow ingress from 0.0.0.0/0 to port 22         |        |      |
|3000442|Failed                 |No VPC access control lists should allow ingress from 0.0.0.0/0 to port 3389         |         |      |
|3000444|Passed                  |         |         |      |
|3000445|Passed                  |        |       |      |
|3000446| Passed                 |         |         |      |
|3000447| Passed                 |         |         |      |
|3000448| Failed                |         |         |      |
|3000449| Failed                 |         |         |      |
|3000451| Failed                 |Virtual Private Cloud (VPC) network access control lists don't allow ingress from 0.0.0.0/0 to any port         |         |      |
|3000452| Failed                  |No VPC access control lists should allow egress to 0.0.0.0/0 to any port         |       |      |
|3000453|Passed                  |Virtual server should have minimum 1 interfaces         |unable to perform on linux host. passed on mgmt vpc         |      |
|3000454|Passed                  |Virtual Servers for VPC instance doesn't have a floating IP         |unable to perform on linux host. passed on mgmt vpc         |      |
|3000455|Passed                  |Virtuval server should have all interfaces with IP-spoofing turned off, -         |unable to perform on linux host. passed on mgmt vpc         |      |
|3000456|Passed                 |Virtual Servers for VPC resource group other than "Default" is selected         |unable to perform on linux host. passed on mgmt vpc      |      |
|3000458|Failed                  |Virtual server boot volume should be encrypted with KYOK, -         |failed on mgmt vpc vsi vserver.         |      |
|3000460|Unable to perform      |Virtual Servers for VPC data volumes are enabled with customer-managed encryption and Keep Your Own Key (KYOK)         |unable to perform on linux host. passed on mgmt vpc         |      |
|3000462|Unable to perform        |Virtual Servers for VPC is provisioned from customer-defined list of images        |unable to perform on linux host. passed on mgmt vpc        |      |
|3000463|Failed                 |Virtual Servers for VPC instances are identifable by the workload they are running based on the Auto Scale for VPC instance         |         |      |
|3000464|N/A                  |Application Load Balancer for VPC has application port of the workload that is identifiable by the Auto Scale for VPC         |         |      |
|3000465|N/A                  |Application Load Balancer for VPC has subnet identifiers of the workload that are identifiable by the Auto Scale for VPC         |         |      |
|3000466|N/A                  |Application Load Balancer for VPC is attached with an Auto Scale for VPC instance group provided with health check         |         |      |
|3000467|Failed                 |         |         |      |
|3000468|N/A                  |Virtual Private Cloud (VPC) is configured with public gateways that are provisionable only within permitted zones         |         |      |
|3000469|Failed                 |VPC application load balancer should be configured with at least one VPC security group         |         |      |
|3000601| Passed                  |         |         |      |
|3000602| N/A                 |Security Insights sends alerts for critical, high, or medium vulnerabilities for images in Container Registry         |         |      |
|3000623| Failed                 | Container Registry has no more than # users with the IAM administrator role         |Container registry instance not created|Doc - account setup       |
|3000627| Failed                 |Platform metrics are not enabled
for Container Registry         |         |      |
|3000628| Passed                 |         |         |      |
|3000635| Passed                 |        |       |      |
|3000636| Failed  |container registry should have at least 3 service IDs with the IAM manager role         |   |SCC fix      |
|3000639|Failed   |container registry access should be managed only by IAM access group          |Container registry instance not created |SCC fix  |
|3000701|N/A                  |App ID webhooks are using HTTPS only         |         |      |
|3000702|N/A                  |App ID email dispatchers are using HTTPS only         |         |      |
|3000703|N/A                  |App ID redirect URIs are using HTTPS only         |         |      |
|3000704|N/A                  |App ID redirect URIs are not using localhost or 127.0.0.1         |         |      |
|3000705|N/A                  |App ID redirect URIs are not using wildcards          |         |      |
|3000706|N/A                  |App ID user data is encrypted         |         |      |
|3000707|N/A                  |App ID user profile updates from client apps is disabled         |         |      |
|3000708|N/A                  |App ID Cloud Directory users aren't able to update their own accounts         |         |     |
|3000709|N/A                  |App ID Cloud Directory users aren't able to self-sign up to applications         |         |  |
|3000710|N/A                  |App ID runtime activity capture is enabled         |         |      |
|3000711|N/A                  |App ID social identity providers are disabled         |         |      |
|3000712|N/A                  |App ID anonymous authentication is disabled         |         |      |
|3000713|N/A                  |App ID password strength regex is configured         |         |      |
|3000714|N/A                  |App ID advanced password policies are enabled         |         |      |
|3000715|N/A                  |App ID avoid password reuse policy is enabled         |         |      |
|3000716|N/A                  |App ID lockout policy after failed # of sign-in attempts is enabled       |         |      |
|3000717|N/A                  |App ID lockout policy after a maximum specified time is enabled         |         |      |
|3000718|N/A                  |App ID minimum period between password changes policy is enabled         |         |      |
|3000719|N/A                  |App ID password expiration policy is enabled         |         |      |
|3000720|N/A                  |App ID prevent username in password policy is enabled         |         |      |
|3000723|N/A                  |App ID multifactor authentication (MFA) is enabled for Cloud Directory users         |         |      |
|3000724|N/A                  |App ID access tokens are configured to expire within # minutes         |         |      |
