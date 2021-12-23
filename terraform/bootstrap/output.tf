output "bootstrap_cos_crn" {
  description = "The Object Storage instance name"
  value       = module.bootstrap_cos.crn
  depends_on  = [module.bootstrap_cos]
}

output "location" {
  description = "The Object Storage instance location"
  value       = module.bootstrap_cos.location
  depends_on  = [module.bootstrap_cos]
}

output "label" {
  description = "The label used for the Object Storage instance"
  value       = module.bootstrap_cos.label
  depends_on  = [module.bootstrap_cos]
}

output "bucket_name" {
  description = "The name of the COS bucket instance"
  value       = ibm_cos_bucket.bucket_instance[0].bucket_name
}

output "bucket_name_1" {
  description = "The name of the COS bucket instance"
  value       = ibm_cos_bucket.bucket_instance_1[0].bucket_name
}