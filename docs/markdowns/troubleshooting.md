# ROKS Pattern

1. Plan after apply: 
   - VPE gateway expects a temporary folder to be present on re-run after apply.
         - Workaround: A workaround of creation of fake temporary folder has already been added to pattern-apply task

2. Missing authorization between COS and HPCS causes the following error below: 
```
Error: InvalidRequest: The Key CRN could not be found
	status code: 400, request id: 67d3a4af-c3fc-4149-82c6-dabcbf7ca0a1, host id: 

  on .terraform/modules/mgmt_flow_log_bucket/main.tf line 30, in resource "ibm_cos_bucket" "bucket_instance":
  30: resource ibm_cos_bucket bucket_instance {
```
3. Access policy with identical attributes already exists:
	- Error is regarding the duplication of authorization policy. You cannot add a “duplicate” policy with the difference being the role. The API's prevent that for good reason.
	- Workaround : Delete the particular policy or you must edit existing policy and you should be good.

4. Subnet conflict: 
	The CIDR block for the requested address prefix conflicts with an existing address prefix.

	Message : CIDR conflicts with existing Subnet in VPC.
	Run the API `GET /subnets` to extract all subnets in VPC. Check the value of `ipv4_cidr_block` to make sure that the CIDR block you provided is not in use by other subnets.
	- If you are using the CLI, you can run `ibmcloud is subnets` and view the value of "Subnet CIDR" to determine if 	  there are any conflicts.

	- See the API documentation for additional help. If this problem persists, contact support.
[Please see here](https://cloud.ibm.com/docs/vpc?topic=vpc-rias-error-messages&locale=fr#subnet_conflict)

5. Error: Module does not support depends_on:
	We will see that because VPE gateway expects a to delete the provider files. 
	- Workaround: Delete the provider.tf files has already been added to pattern-apply task
	It is not an actual error. We will see those errors as the init performs before the deletion of provider.tf according to the task.


6. HPCS key deletion: 
 	- Sometimes you might fail to delete HPCS keys. This happens because HPCS thinks that the key is being used by the resource which is already ordered to destroy. We are working with HPCS team to resolve this.
    Workaround: Open an issue with HPCS team. We think that it might be happening because the buckets using the key and ordered to delete might still not be reclaimed for 30 days.
 
