/*variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud api key"
  default = "aVwDMOXdh1p3kwpC9inL1d6v8J4YpiNBa-DPXvVil1wr"
}
*/

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "resource_group_provision" {
  type        = bool
  description = "Flag indicating that the resource group should be provisioned"
  default     = false
}

variable "region" {
  type        = string
}

variable "name_prefix" {
  type        = string
}

variable "plan" {
  type        = string
  description = "The type of plan the service instance should run under (trial or graduated-tier)"
  default     = "standard"
}

variable "provision" {
  type        = bool
  description = "Flag indicating that instance should be provisioned"
  default     = false
}

variable "name" {
  type        = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default     = ""
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = []
}

variable "label" {
  type        = string
  description = "The label used to build the resource name if not provided."
  default     = "cis"
}