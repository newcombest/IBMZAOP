terraform {
  required_version = ">= 0.13.2"

  backend "s3" {
    key                         = "pattern.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}
