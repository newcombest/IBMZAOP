variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud api key"
}

variable "bootstrap_resource_group_name" {
  type        = string
  description = "The name of the bootstrap resource group"
}

variable "bootstrap_resource_group_provision" {
  type        = bool
  description = "Should the recource group be provisioned"
  default     = false
}

variable "bootstrap_name_prefix" {
  type        = string
  description = "The prefix for cos bucket for bootstrap"
  default     = ""
}

variable "provision" {
  type        = bool
  description = "Should the recource group be provisioned"
  default     = true
}

#Bootstrap cos instance details
variable "bootstrap_cos_provision" {
  type        = bool
  description = "Should the recource group be provisioned"
  default     = true
}

variable "bootstrap_cos_name_prefix" {
  type        = string
  description = "The prefix for cos instance for bootstrap"
  default     = ""
}

variable "bootstrap_cos_name" {
  type        = string
  description = "The name of the for cos instance for bootstrap"
  default     = ""
}

variable "bootstrap_cos_location" {
  type        = string
  description = "Location of the bootstrap cos"
  default     = "global"
}

variable "bootstrap_cos_plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite or standard)"
  default     = "standard"
}

variable "bootstrap_cos_label" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = ""
}

variable "bootstrap_cos_tags" {
  type        = string
  description = "Tags that should be applied to the bootstrap cos service"
  default     = ""
}

#Bootstrap cos bucket details
variable "bootstrap_tfstate_bucket_name" {
  type        = string
  description = "The name of the cos bucket name for bootstrap"
}

variable "bootstrap_hpcskey_bucket_name" {
  type        = string
  description = "The name of the cos bucket name for bootstrap"
}

variable "bootstrap_cos_bucket_location" {
  type        = string
  description = "Location of the bootstrap cos bucket"
  default     = "us-south"
}

variable "bootstrap_cos_bucket_storage_class" {
  type        = string
  description = "Flag indicating that COS Bucket should be provisioned"
  default     = "standard"
}

#key protect instance details
variable "key_protect_plan" {
  description = "The key protect plan to provision"
  type        = string
  default     = "tiered-pricing"
}

variable "key_protect_provision" {
  type        = bool
  description = "Should the recource group be provisioned"
  default     = true
}

variable "key_protect_name" {
  description = "The name of the key protcet instance"
  type        = string
  default     = ""
}

variable "key_protect_region" {
  description = "The location where key protect instance will be created"
  type        = string
  default     = "us-south"
}

variable "key_protect_name_prefix" {
  description = "Prefix name that should be used for the cluster and services. If not provided then resource_group_name will be used"
  type        = string
  default     = ""
}

variable "key_protect_label" {
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  type        = string
  default     = ""
}

#KMS key details
variable "kms_key_provision" {
  type        = bool
  description = "Should the recource group be provisioned"
  default     = true
}

variable "kms_key_crn" {
  type        = string
  description = "The crn of the root key in the KMS"
  default     = null
}

variable "kms_key_region" {
  description = "Geographic location of the resource"
  type        = string
  default     = "us-south"
}

variable "kms_key_name_prefix" {
  description = "Prefix name that should be used for the cluster and services. If not provided then resource_group_name will be used"
  type        = string
  default     = ""
}

variable "kms_key_name" {
  description = "The name of kms key"
  type        = string
  default     = ""
}

variable "kms_key_label" {
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  type        = string
}
