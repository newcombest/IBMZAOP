locals {
  bucket_name = lower(replace(var.bootstrap_tfstate_bucket_name != "" ? "${var.bootstrap_name_prefix}-${var.bootstrap_tfstate_bucket_name}" : "${var.bootstrap_name_prefix}-${var.bootstrap_resource_group_name}-bootstrap-bucket", "_", "-"))
}

module "resource_group" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-resource-group?ref=v2.2.1"

  resource_group_name = var.bootstrap_resource_group_name
  ibmcloud_api_key    = var.ibmcloud_api_key
  provision           = var.bootstrap_resource_group_provision
}

module "bootstrap_cos" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-object-storage?ref=v3.2.0"

  provision           = var.bootstrap_cos_provision
  resource_group_name = module.resource_group.name
  name_prefix         = var.bootstrap_cos_name_prefix
  name                = var.bootstrap_cos_name
  resource_location   = var.bootstrap_cos_location
  tags                = tolist(setsubtract(split(",", var.bootstrap_cos_tags), [""]))
  plan                = var.bootstrap_cos_plan
  label               = var.bootstrap_cos_label
}

resource "ibm_cos_bucket" "bucket_instance" {
  count = (var.provision ? 1 : 0)

  depends_on           = [module.bootstrap_cos]
  bucket_name          = var.bootstrap_tfstate_bucket_name
  resource_instance_id = module.bootstrap_cos.id
  region_location      = var.bootstrap_cos_bucket_location
  storage_class        = var.bootstrap_cos_bucket_storage_class
  key_protect          = module.kms_key.crn

  object_versioning {
    enable = true
  }
}

resource "ibm_cos_bucket" "bucket_instance_1" {
  count = (var.provision ? 1 : 0)

  depends_on           = [module.bootstrap_cos]
  bucket_name          = var.bootstrap_hpcskey_bucket_name
  resource_instance_id = module.bootstrap_cos.id
  region_location      = var.bootstrap_cos_bucket_location
  storage_class        = var.bootstrap_cos_bucket_storage_class
  key_protect          = module.kms_key.crn

  object_versioning {
    enable = true
  }
}

resource "ibm_resource_key" "cos_credentials" {
  count = (var.provision ? 1 : 0)

  depends_on           = [module.bootstrap_cos]
  name                 = module.bootstrap_cos.name
  resource_instance_id = module.bootstrap_cos.id
  role                 = "Manager"
  parameters           = { "HMAC" : true }
  //User can increase timeouts
  timeouts {
    create = "15m"
    delete = "15m"
  }
}

module "key_protect" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-key-protect?ref=v2.1.1"

  provision           = var.key_protect_provision
  resource_group_name = module.resource_group.name
  region              = var.key_protect_region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name                = var.key_protect_name
  plan                = var.key_protect_plan
  name_prefix         = var.key_protect_name_prefix
  label               = var.key_protect_label
}

module "kms_key" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-kms-key?ref=v1.2.0"

  provision        = var.kms_key_provision
  region           = var.kms_key_region
  ibmcloud_api_key = var.ibmcloud_api_key
  name_prefix      = var.kms_key_name_prefix
  name             = var.kms_key_name
  label            = var.kms_key_label
  kms_id           = module.key_protect.guid
}
