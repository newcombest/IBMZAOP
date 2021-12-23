variable "mgmt_load_balancer_provision" {
  description = "set true to create, false to skip"
  type        = bool
  default     = true
}
variable "workload_load_balancer_provision" {
  description = "set true to create, false to skip"
  type        = bool
  default     = true
}
variable "workload2_load_balancer_provision" {
  description = "set true to create, false to skip"
  type        = bool
  default     = true
}
variable "workload3_load_balancer_provision" {
  description = "set true to create, false to skip"
  type        = bool
  default     = true
}
variable "mgmt_load_balancer_name" {
  type        = string
  description = "The name of load balancer"
  default     = "mgmtloadbalancer"
}
variable "workload_load_balancer_name" {
  type        = string
  description = "The name of load balancer"
  default     = "wrkloadbalancer"
}
variable "workload2_load_balancer_name" {
  type        = string
  description = "The name of load balancer"
  default     = "wrkloadbalancer2"
}
variable "workload3_load_balancer_name" {
  type        = string
  description = "The name of load balancer"
  default     = "wrkloadbalancer3"
}
variable "type" {
  description = "nlb type: public/private"
  type        = string
  default     = "private"
}
variable "lb_tags" {
  description = "List of Tags for the Load Balancer"
  type        = list(string)
  default     = []
}
variable "appid_tags" {
  type        = string
  description = "Tags that should be applied to the service"
  default     = "[]"
}

variable "appid_name_prefix" {
  type        = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
  default     = ""
}

variable "appid_plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite or graduated-tier)"
  default     = "graduated-tier"
}
