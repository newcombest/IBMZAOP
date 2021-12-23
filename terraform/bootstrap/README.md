# Terraform Bootstrap Minimal Environment

TThis is a collection of modules of Cloud Object Storage and Cloud Object Storage Bucket that make it easier to provision and manage COS Instance IBM Cloud Platform:

Bootstrap Minimal Environment module provision:
* COS instance 
* COS bucket

## cos_instance module

This module creates new COS instance if `provision` flag is `true` otherwise get the guid of exiting COS intance matching with the provided service name.

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v13
- kubectl

### Terraform providers

- IBM Cloud provider >= 1.18


## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.


## Module dependencies

Resource group - github.com/cloud-native-toolkit/terraform-ibm-resource-group.git
Object storage - github.com/ibm-garage-cloud/terraform-ibm-object-storage.git
Bucket         - github.com/ibm-garage-cloud/terraform-ibm-object-storage-bucket.git

## Example usage

```hcl-terraform
module "cos_instance" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-object-storage.git?ref=v2.1.0"

  resource_group_name = var.resource_group_name
  name_prefix         = var.name_prefix
  provision           = var.cos_provision
  resource_location   = var.cos_resource_location
  service             = var.service
  tags                = var.tags
}


module "cos_bucket" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-object-storage-bucket.git"

  resource_group_name = module.resource_group.name
  cos_instance_id     = module.cos.id
  name_prefix         = var.name_prefix
  ibmcloud_api_key    = var.ibmcloud_api_key
  name                = "my-test-bucket"
  region              = var.region
}
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | ~> 0.13  |
| OS        | Mac/Linux|
|

## Providers

| Name | Version |
|------|---------|
| ibm  |   n/a   |


# Inputs

| Name              | Description                                     | Type     | Required | 
|-------------------|-------------------------------------------------|----------|----------|
|  name             | The name of the COS instance.                   | `string` |   yes    |  
|  service      	  | Service type fsupported by service.             | `string` |   yes    |  
|  Location	        | The location of the instance.                   | `string` |   yes    |                        
|  plan             | The name of the plan type supported by service. | `string` |   yes    |  
|  resource_group   | The name of the resource group.                 | `string` |   yes    |  
|  region_location  | location of the resource.                       | `string` |   Yes    |
|  tags             | the tag for the instance.                       | `string` |   Yes    |
|  bucket_name      | The name of the COS bucket.                     | `string` |   yes    |  
|  storage_class	  | Storage class to use for the bucket.	          | `string` |   yes    |


## Outputs

| Name              | Description                   | Type     | Required |
|-------------------|-------------------------------|----------|----------|
| cos_instance_id   | The id of the cos instance.   |`string`  |   Yes    |
| cos_bucket        | The name of the cos instance. |`string`  |   Yes    |



Note:

All optional fields are given value null in varaible.tf file. User can configure the same by overwriting with appropriate values.
