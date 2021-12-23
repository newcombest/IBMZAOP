# Référence du développeur

## VPC Gestion/Traitement 

``` {terraform}

module "management-vpc" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc?ref=v1.8.1"

  resource_group_id   = module.resource_group.id
  resource_group_name = module.resource_group.name
  region              = var.region
  name                = var.management-vpc_name
  name_prefix         = var.cs_name_prefix
  ibmcloud_api_key    = var.ibmcloud_api_key
  provision           = var.management-vpc_provision
}

```

### Entrées

| Nom                | Description                                                                  | Type     | Requis   |
|--------------------|------------------------------------------------------------------------------|----------|----------|
| resource_group_id  | Indique si l'utilisateur veut initialiser le HPCS         .                  | `string` | Oui      |
| resource_group_name| Nom du groupe de ressource                                                   | `string` | Oui      |
| region             | Localisation géographique (e.g. us-south, us-east)                           | `string` | Oui      |
| name               | Nom de l'instance VPC                                                        | `string` | Oui      |
| name_prefix        | Préfix pour le service. Si vide, le nom du groupe de ressource sera utilisé  | `string` | Oui      |
| ibmcloud_api_key   | Jeton API du IBM Cloud                                                       | `string` | Oui      |
| provision          | Variable indiquant que l'instance doit être provisionnée. S'il est faux, une instance existante sera recherchée.                                                  | `bool` | True      |

## Module Passerelle VPC pour Gestion/Traitement

``` {terraform}

module "workload-vpc-gateway" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-gateways?ref=v1.2.2"

  resource_group_id = module.resource_group.id
  vpc_name          = module.workload-vpc.name
  region            = var.region
  ibmcloud_api_key  = var.ibmcloud_api_key
}

```

### Entrées

| Nom               | Description                                                             | Type     | Requis   |
|-------------------|-------------------------------------------------------------------------|----------|----------|
| resource_group_id | Indique si l'utilisateur veut initialiser le HPCS.                      | `string` | Yes      |
| vpc_name          | Nom de l'instance VPC.                                                  | `string` | Yes      |
| region            | Localisation géographique (e.g. us-south, us-east)                      | `string` | Yes      |
| ibmcloud_api_key  | Jeton API du IBM Cloud                                                  | `string` | Yes      |

## Module Sous-réseau VPC (Pour VPE, VPN, Bastion, SCC)

``` {terraform}

module "mgmt-subnets" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-subnets?ref=v1.2.3"

  resource_group_id  = module.resource_group.id
  vpc_name           = module.management-vpc.name
  gateways           = module.mgmt-vpc-gateway.gateways
  region             = var.region
  ibmcloud_api_key   = var.ibmcloud_api_key
  _count             = var.mgmt-subnets__count
  label              = var.mgmt-subnets_label
  ipv4_cidr_blocks   = var.mgmt-subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.mgmt-subnets_ipv4_cidr_blocks)
  ipv4_address_count = var.mgmt-subnets_ipv4_address_count
  provision          = var.mgmt-subnets_provision
  acl_id             = module.management-vpc.acl_id
}

```

### Entrées

| Name              | Description                                                             | Type     | Required |
|-------------------|-------------------------------------------------------------------------|----------|----------|
| region            | Localisation géographique (e.g. us-south, us-east)                      | `string` | Yes      |
| ibmcloud_api_key  | Jeton API du IBM Cloud                                                  | `string` | Yes      |
|label              | Étiquette pour les sous-réseaux                                         | `string` | Yes      |
| name_prefix       | Préfix pour le service. Si vide, le nom du groupe de ressource sera utilisé                                                 | `string` | Yes      |
| provision         | Variable indiquant que l'instance doit être provisionnée. S'il est faux, une instance existante sera recherchée                                                  | `bool` | True      |

## Module VPN/Bastion VSI pour Gestion/Traitement

``` {terraform}

  module "mgmt_vpc_vsi" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-vpc-vsi?ref=v1.6.0"

  resource_group_id         = module.resource_group.id
  region                    = var.region
  ibmcloud_api_key          = var.ibmcloud_api_key
  vpc_name                  = module.management-vpc.name
  vpc_subnet_count          = module.mgmt-subnets.count
  vpc_subnets               = module.mgmt-subnets.subnets
  ssh_key_id                = module.mgmt_ssh_scc.id
  kms_key_crn               = module.hpcs_key.crn
  kms_enabled               = var.kms_enabled
  allow_deprecated_image    = false
}
```

### Entrées

| Nom               | Description                                                             | Type     | Requis   |
|-------------------|-------------------------------------------------------------------------|----------|----------|
| resource_group_id | Indique si l'utilisateur veut initialiser le HPCS.                      | `string` | Oui      |
| region            | Localisation géographique (e.g. us-south, us-east)                      | `string` | Oui      |
| ibmcloud_api_key  | Jeton API du IBM Cloud                                                   | `string` | Oui      |
| kms_enabled       | Activation clé KMS                                                      | `bool`   | Vrai     |

## Module Collecteur SCC VSI

``` {terraform}

module "mgmt_scc_collector" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-scc-collector?ref=v1.1.0"

  resource_group_id    = module.resource_group.id
  region               = var.region
  ibmcloud_api_key     = var.ibmcloud_api_key
  vpc_name             = module.management-vpc.name
  vpc_subnet_count     = module.mgmt-scc-subnets.count
  vpc_subnets          = module.mgmt-scc-subnets.subnets
  ssh_key_id           = module.mgmt_ssh_scc.id
  ssh_private_key      = module.mgmt_ssh_scc.private_key
  scc_registration_key = var.scc_registration_key
}
```

### Entrées

| Name              | Description                                                             | Type     | Requis |
|-------------------|-------------------------------------------------------------------------|----------|----------|
| resource_group_id | Indique si l'utilisateur veut initialiser le HPCS.                      | `string` | Oui      |
| region            | Localisation géographique (e.g. us-south, us-east)                      | `string` | Oui      |
| ibmcloud_api_key  | Jeton API du IBM Cloud                                                  | `string` | Oui      |
| scc_registration_key | Clé d'enregistrement SCC                                             | `string` | Oui      |
