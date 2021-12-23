# Modules: Variables Définies

### cs_resource_group
| Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
|cs_resource_group_name| Nom du groupe de ressources|string    |Oui     |          |
| ibmcloud_api_key | Jeton API du IBM Cloud | `string` | Oui |    |  
|cs_resource_group_provision| Variable indiquant que le groupe de ressources doit être créé |bool      |Non      |False     |

### hpcs_resource_group
| Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
|hpcs_resource_group_name| Nom du groupe de ressources|string    |Oui    |    
| ibmcloud_api_key | Jeton API du IBM Cloud | `string` | Oui |    |  
|hpcs_resource_group_provision| Variable indiquant que le groupe de ressources doit être créé |bool      |Non      |False     |

### mgmt_resource_group
| Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
|mgmt_resource_group_name|Nom du groupe de ressources|string    |Yes     |          |
| ibmcloud_api_key | Jeton API du IBM Cloud | `string` | Yes |    |  
|mgmt_resource_group_provision| Variable indiquant que le groupe de ressources doit être créé|bool      |Non     |False     |

### workload_resource_group
| Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
|workload_resource_group_name|Nom du groupe de ressources|string    |Yes     |          |
| ibmcloud_api_key | Jeton API du IBM Cloud | `string` | Yes |    |  
|workload_resource_group_provision| Variable indiquant que le groupe de ressources doit être créé|bool      |Non     |False     |

### hpcs
| Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
|hpcs_region         |Région ou le service est déployé    |string    |Non      |us-south  |
|hpcs_name_prefix    |Préfix pour le service. Si vide, le nom du groupe de ressources sera utilisé |string    |Non      |          |
|hpcs_name           |Nom du service. Si vide, le nom par défaut sera {name prefix}-{service}|string    |Non      |          |
| ibmcloud_api_key | Jeton API du IBM Cloud  | `string` | Oui |    |  
|private_endpoint    |Variable indiquant que le groupe de ressources doit être créé avec des  points d'accès privés |string    |Non      |true      |
|hpcs_plan           |Type de plan de facturation pour le service (tiered-pricing)|string    |No      |standard  |
|hpcs_tags           |Étiquette appliquée au service |string    |Non      |[]        |
|hpcs_number_of_crypto_units|Nombre d'unité crypto qui doivent être relié à l'instance |Nombre    |Non      |2         |
|hpcs_provision      |Variable indiquant que le groupe de ressources doit être créé. Si 'false' alors l'instance est censée exister.|bool      |Non      |False     |
|hpcs_label          |Étiquette qui sera utilisé pour générer le nom à partir de name_prefix.|string    |Non      |hpcs      |

### hpcs_init
| Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| hpcs_initialize | ATTENTION: Si TRUE, l'instance HPCS provisionnée ou le guide hpcs_instance_guid, s'il est défini, sera initialisé. | `bool  ` | Non     | False  |
| tke_files_path | Chemin local où les fichiers TKE seront enregistrés. Doit être défini | `string` | Oui    |        |
| admin1_name | Nom du premier Admin | `string` | Oui    |        |
| admin1_password | Mot de passe du premier Admin | `string` | Oui    |        |
| admin2_name | Nom du second Admin | `string` | Oui    |        |
| admin2_password | Mot de passe du second Admin | `string` | Oui    |        |
| admin_num | Nombre d'Admin pouvant gérer le HPCS | `number` | Non     | 2      |
| threshold_value | Seuil limite | `number` | Non     | 2      |
| rev_threshold_value | Supprimer / détruire la valeur du seuil | `number` | Non     | 2      |

### upload_to_cos
| Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| hpcs_initialize | ATTENTION: Si TRUE, l'instance HPCS provisionnée ou le guide hpcs_instance_guid, s'il est défini, sera initialisé. | `bool  ` | Non     | False  |
| ibmcloud_api_key | Jeton API du IBM Cloud  | `string` | Oui |    | 
| cos_crn |
| endpoint |
| bucket_name |
| tke_files_path |

### remove_tke_files
 Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| hpcs_initialize | ATTENTION: Si TRUE, l'instance HPCS provisionnée ou le guide hpcs_instance_guid, s'il est défini, sera initialisé. | `bool  ` | Non     | False  |
| tke_files_path |

### hpcs_policies
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| hpcs_initialize | ATTENTION: Si TRUE, l'instance HPCS provisionnée ou le guide hpcs_instance_guid, s'il est défini, sera initialisé. | `bool  ` | Non     | False  |
| region | Région ou le service est déployé (e.g. us-south, us-east) | `string` | Non     | us-south |
| allowed_network_type | La politique d'accès au réseau à appliquer à votre instance Hyper Protect Crypto Services. Les valeurs acceptables sont public-and-private ou private-only.Une fois que la politique d'accès au réseau est définie sur private-only, vous ne pouvez pas accéder à votre instance depuis le réseau public et vous ne pouvez pas afficher ou gérer les clés via l'interface utilisateur. Cependant, vous pouvez toujours ajuster le paramètre réseau ultérieurement à l'aide de l'API ou de l'CLI. | `string` | Non     | public-and-private |
| hpcs_port | Port de servicee HPCS | `number` | Non     | 11705  |
| dual_auth_delete | Politique de suppression de la double authentification activée ou non | `bool  ` | Non     | True   |

### mgmt_kms_key
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| ibmcloud_api_key | Jeton API du IBM Cloud | `string` | Oui |    | 
|mgmt_name_prefix    |Nom du préfix du service. Si vide, le nom par défaut sera {name prefix}-{service}`|string    |Non      |devmgmt   |
|mgmt_kms_key_provision|Variable indiquant que le groupe de ressources doit être créé. Si 'false' alors l'instance est censée exister|bool      |Non      |True      |
|mgmt_kms_key_name   |Le nom de la clé racine dans l'instance kms. Requis si kms_enabled est true|string    |Non      |          |
|mgmt_kms_key_label  |L'étiquette utilisée pour construire le nom si elle n'est pas fournie. Si elle est utilisée, le nom sera `{name_prefix}-{label}`|string    |Non      |key       |
|mgmt_kms_key_rotation_interval|L'intervalle en mois pour la rotation d'une clé racine.|number    |Non      |3         |
|mgmt_kms_key_dual_auth_delete|Variable indiquant que la clé nécessite une double autorisation pour être supprimée.|bool      |Non      |False     |

### workload_kms_key
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| ibmcloud_api_key | Jeton API du IBM Cloud | `string` | Oui |    | 
|workload_name_prefix|om du préfix du service. Si vide, le nom par défaut sera `{name_prefix}-{label}`|string    |Non      |devwrk    |
|workload_kms_key_provision|Variable indiquant que le groupe de ressources doit être créé. Si 'false' alors l'instance est censée exister|bool      |Non      |True      |
|workload_kms_key_name|Le nom de la clé racine dans l'instance kms. Requis si kms_enabled est true |string    |Non      |          |
|workload_kms_key_label|L'étiquette utilisée pour construire le nom si elle n'est pas fournie. Si elle est utilisée, le nom sera `{name_prefix}-{label}`|string    |Non      |key       |
|workload_kms_key_rotation_interval|L'intervalle en mois pour la rotation d'une clé racine. |number    |Non      |3         |
|workload_kms_key_dual_auth_delete|Variable indiquant que la clé nécessite une double autorisation pour être supprimée.|bool      |No n

### mgmt_cos
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
|mgmt_name_prefix    |Le préfixe du nom utilisé pour construire le nom s'il n'est pas fourni. S'il est utilisé, le nom sera `{name_prefix}-{label}`|string    |Non      |devmgmt   |
|mgmt_cos_resource_location|Localisation géographique de la ressource (e.g. us-south, us-east)|string    |Non      |global    |
|mgmt_cos_tags       |Les étiquettes qui doivent être appliquées au service|string    |Non      |[]        |
|mgmt_cos_plan       |Le type de plan sous lequel l'instance de service doit fonctionner (lite ou standard)|string    |Non      |standard  |
|mgmt_cos_provision  |Variable indiquant que l'instance de protection de clé doit être provisionnée |bool      |Non      |True      |
|mgmt_cos_label      |Le nom qui doit être utilisé pour le service, en particulier lors de la connexion à un service existant. S'il n'est pas fourni, le nom proposé par défaut sera {name prefix}-{service}|string    |Non      |cos       |

### workload_cos
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
|workload_name_prefix|Le préfixe du nom utilisé pour construire le nom s'il n'est pas fourni. S'il est utilisé, le nom sera `{name_prefix}-{label}`|string    |Non      |devwrk    |
|workload_cos_resource_location|Localisation géographique de la ressource (e.g. us-south, us-east)|string    |Non      |global    |
|workload_cos_tags   |Les étiquettes qui doivent être appliquées au service|string    |No      |[]        |
|workload_cos_plan   |TLe type de plan sous lequel l'instance de service doit fonctionner (lite or standard)|stnring    |No      |standard  |
|workload_cos_provision|Variable indiquant que l'instance de protection de clé doit être provisionnée |bool      |No      |True      |
|workload_cos_label  |Le nom qui doit être utilisé pour le service, en particulier lors de la connexion à un service existant. S'il n'est pas fourni, le nom proposé par défaut sera {name prefix}-{service} |string    |No      |cos       |

### mgmt_cos_auth
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| mgmt_cos_auth_source_service_name |Le nom du service qui sera autorisé à accéder au service cible. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services.|string    |Non      |cloud-object-storage       |
| mgmt_cos_auth_source_resource_instance_id | L'identifiant d'instance du service source. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte.|string    |Oui      |      |
| mgmt_cos_auth_source_resource_type |Le type de ressource du service source. Cette valeur est utilisée pour définir les sous-types de services dans le catalogue de services. (e.g. flow-log-collector).|string    |Oui      |      |
| mgmt_cos_auth_source_resource_group_id | L'identifiant du groupe de ressources qui sera utilisé pour déterminer quels services sources seront autorisés à accéder au service cible. S'il n'est pas fourni, l'autorisation s'appliquera à l'ensemble du compte. Cette valeur est remplacée par l'option source_resource_instance_id |string    |Oui      |      |
| mgmt_cos_auth_provision | Variable indiquant que l'autorisation de service doit être créée |bool    |No    n  |   True  |
| mgmt_cos_auth_target_service_name | Le nom du service auquel le service source sera autorisé à accéder. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services. |string    |Non      |   hs-crypto   |
| mgmt_cos_auth_target_resource_instance_id | L'identifiant d'instance du service cible. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte. |string    |Oui      |      |
| mgmt_cos_auth_target_resource_type | Le type de ressource du service cible. Cette valeur est utilisée pour définir les sous-types de services dans le catalogue de services (e.g. flow-log-collector). |string    |Oui      |      |
| mgmt_cos_auth_roles | Une liste des rôles qui doivent être accordés sur le service cible. (e.g. Reader, Writer). |string    |Non      |   [\"Reader\"]  |
| mgmt_cos_auth_source_service_account | GUID du compte où se trouve le service source de l'identifiant de l'instance du service cible. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte de service est provisionné. Cette valeur est nécessaire pour autoriser l'accès au service sur plusieurs comptes. |string    |Oui      |      |

### workload_cos_auth
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| workload_cos_auth_source_service_name | TLe nom du service qui sera autorisé à accéder au service cible. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services. | `string` | Non     | cloud-object-storage |
| workload_cos_auth_source_resource_instance_id |  L'identifiant d'instance du service source. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte. | `string` | Non     | null   |
| workload_cos_auth_source_resource_type | Le type de ressource du service source. Cette valeur est utilisée pour définir les sous-types de services dans le catalogue de services. (e.g. flow-log-collector). | `string` | Non     | null   |
| workload_cos_auth_source_resource_group_id | L'identifiant du groupe de ressources qui sera utilisé pour déterminer quels services sources seront autorisés à accéder au service cible. S'il n'est pas fourni, l'autorisation s'appliquera à l'ensemble du compte. Cette valeur est remplacée par l'option source_resource_instance_id| `string` | Non     | null   |
| workload_cos_auth_provision | Variable indiquant que l'autorisation de service doit être créée | `bool  ` | Non     | False  |
| workload_cos_auth_target_service_name | Le nom du service auquel le service source sera autorisé à accéder. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services. | `string` | Non     | hs-crypto |
| workload_cos_auth_target_resource_instance_id |L'identifiant d'instance du service cible. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte. | `string` | Non     | null   |
| workload_cos_auth_target_resource_type | Le type de ressource du service cible. Cette valeur est utilisée pour définir les sous-types de services dans le catalogue de services (e.g. flow-log-collector). | `string` | Non     | null   |
| workload_cos_auth_roles | Une liste des rôles qui doivent être accordés sur le service cible. (e.g. Reader, Writer). | `string` | Non     | ["Reader"] |
| workload_cos_auth_source_service_account | GUID du compte où se trouve le service source de l'identifiant de l'instance du service cible. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte de service est provisionné. Cette valeur est nécessaire pour autoriser l'accès au service sur plusieurs comptes. | `string` | Non     | null   |

### mgmt_flow_log_auth
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| mgmt_flow_log_auth_source_service_name | Le nom du service qui sera autorisé à accéder au service cible. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services. | `string` | Non     | is     |
| mgmt_flow_log_auth_source_resource_instance_id | L'identifiant d'instance du service source. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte. | `string` | Non     | null   |
| mgmt_flow_log_auth_source_resource_type | Le type de ressource du service source. Cette valeur est utilisée pour définir des sous-types de services dans le catalogue de services (e.g. flow-log-collector). | `string` | Non     | flow-log-collector |
| mgmt_flow_log_auth_source_resource_group_id | L'identifiant du groupe de ressources qui sera utilisé pour déterminer quels services sources seront autorisés à accéder au service cible. S'il n'est pas fourni, l'autorisation s'appliquera à l'ensemble du compte. Cette valeur est remplacée par l'option source_resource_instance_id | `string` | Non     | null   |
| mgmt_flow_log_auth_provision | Variable indiquant que le service d'autorisation doit être créée | `bool  ` | Non     | True   |
| mgmt_flow_log_auth_target_service_name | Le nom du service auquel le service source sera autorisé à accéder. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services. | `string` | Non     | cloud-object-storage |
| mgmt_flow_log_auth_roles | Une liste des rôles qui doivent être accordés sur le service cible. (e.g. Reader, Writer). | `string` | Non     | ["Writer"] |
| mgmt_flow_log_auth_source_service_account | GUID du compte où se trouve le service source de l'identifiant de l'instance du service cible. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte de service est provisionné. Cette valeur est nécessaire pour autoriser l'accès au service sur plusieurs comptes. | `string` | Non     | null   |

### workload_flow_log_auth
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| workload_flow_log_auth_source_service_name |Le nom du service qui sera autorisé à accéder au service cible. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services. | `string` | Non     | is     |
| workload_flow_log_auth_source_resource_instance_id | L'identifiant d'instance du service source. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte. | `string` | Non     | null   |
| mgmt_flow_log_auth_source_resource_type | Le type de ressource du service source. Cette valeur est utilisée pour définir des sous-types de services dans le catalogue de services (e.g. flow-log-collector). | `string` | Non     | flow-log-collector |
| workload_flow_log_auth_source_resource_type | The resource type of the source service. This value is used to define sub-types of services in the service catalog (e.g. flow-log-collector). | `string` | Non     | flow-log-collector |
| workload_flow_log_auth_source_resource_group_id | L'identifiant du groupe de ressources qui sera utilisé pour déterminer quels services sources seront autorisés à accéder au service cible. S'il n'est pas fourni, l'autorisation s'appliquera à l'ensemble du compte. Cette valeur est remplacée par l'option source_resource_instance_id | `string` | Non     | null   |
| workload_flow_log_auth_provision | Flag indicating that the service authorization should be created | `bool  ` | No     | False  |
| workload_flow_log_auth_target_service_name | Le nom du service auquel le service source sera autorisé à accéder. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services. | `string` | Non     | cloud-object-storage |
| workload_flow_log_auth_target_resource_instance_id | L'identifiant d'instance du service cible. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte. | `string` | Non     | null   |
| workload_flow_log_auth_target_resource_type | Le type de ressource du service cible. Cette valeur est utilisée pour définir les sous-types de services dans le catalogue de services. (e.g. flow-log-collector). | `string` | Non     | null   |
| workload_flow_log_auth_roles | Une liste des rôles qui doivent être accordés sur le service cible. (e.g. Reader, Writer). | `string` | Non     | ["Writer"] |
| workload_flow_log_auth_source_service_account | GUID du compte où le service source est provisionné. Cette information est nécessaire pour autoriser l'accès au service sur plusieurs comptes. | `string` | Non     | null   |

### mgmt_flow_log_bucket
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| mgmt_flow_log_bucket_activity_tracker_crn | Le crn de l'instance de suivi des activités | `string` | Non     | null   |
| mgmt_flow_log_bucket_metrics_monitoring_crn | Le crn de l'instance de suivi des métriques | `string` | Non     | null   |
| ibmcloud_api_key | Jeton API du IBM Cloud | `string` | Oui    |        |
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Oui   |        |
| mgmt_name_prefix | Le préfixe du nom utilisé pour construire le nom s'il n'est pas fourni. S'il est utilisé, le nom sera `{name_prefix}-{label}` | `string` | Non     | devmgmt |
| mgmt_flow_log_bucket_provision | Variable indiquant que l'instance doit être provisionnée. S'il est faux, une instance existante sera recherchée. | `bool  ` | Non     | True   |
| mgmt_flow_log_bucket_name | Nom du bucket | `string` | Non     |        |
| mgmt_flow_log_bucket_label | Étiquette utilisée pour construire le bucketsi non fourni. | `string` | Non     | flow-logs |
| mgmt_flow_log_bucket_cross_region_location | L'emplacement interrégional du bucket. Cette valeur est facultative. Les valeurs valides sont (us, eu, et ap). Cette valeur a la priorité sur les autres si elle est fournie. | `string` | Non     |        |
| mgmt_flow_log_bucket_storage_class | Classe de stockage du bucket. Les valeurs prises en charge sont standard, vault, cold, flex, smart. | `string` | Non     | standard |
| mgmt_flow_log_bucket_allowed_ip |Une liste d'adresses IPv4 ou IPv6 en notation CIDR auxquelles vous souhaitez autoriser l'accès à votre serveur IBM Cloud Object Storage bucket. | `string` | Non     | ["0.0.0.0/0"] |

### workload_flow_log_bucket
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| workload_flow_log_bucket_activity_tracker_crn | Le crn de l'instance de suivi des activités | `string` | Non     | null   |
| workload_flow_log_bucket_metrics_monitoring_crn | Le crn de l'instance de suivi des métriques | `string` | Non     | null   |
| ibmcloud_api_key | Jeton API du IBM Cloud | `string` | Oui    |        |
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Oui    |        |
| workload_name_prefix | Le préfixe du nom utilisé pour construire le nom s'il n'est pas fourni. S'il est utilisé, le nom sera `{name_prefix}-{label}` | `string` | Non     | devwrk |
| workload_flow_log_bucket_provision | Variable indiquant que l'instance doit être provisionnée. Si elle est fausse, une instance existante sera recherchée.| `bool  ` | No     | True   |
| workload_flow_log_bucket_name | Nom du bucket | `string` | Non     |        |
| workload_flow_log_bucket_label | Étiquette utilisée pour construire le bucketsi non fourni. | `string` | Non     | flow-logs |
| workload_flow_log_bucket_cross_region_location | L'emplacement interrégional du bucket. Cette valeur est facultative. Les valeurs valides sont (us, eu, et ap). Cette valeur a la priorité sur les autres si elle est fournie. | `stLring` | Non     |        |
| workload_flow_log_bucket_storage_class |  Classe de stockage du bucket. Les valeurs prises en charge sont standard, vault, cold, flex, smart. | `string` | Non     | standard |
| workload_flow_log_bucket_allowed_ip |Une liste d'adresses IPv4 ou IPv6 en notation CIDR auxquelles vous souhaitez autoriser l'accès à votre serveur IBM Cloud Object Storage bucket. | `string` | Non     | ["0.0.0.0/0"] |

### mgmt_flow_logs
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Oui    |        |
| ibmcloud_api_key | The IBM Cloud api token | `string` | Oui    |        |
| mgmt_flow_logs_provision | Variable indiquant que le sous-réseau doit être provisionné. Si 'false', le sous-réseau sera recherché. | `bool  ` | Non     | True   |

### workload_flow_logs
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Oui    |        |
| ibmcloud_api_key | The IBM Cloud api token | `string` | Oui    |        |
| workload_flow_logs_provision | Variable indiquant que le sous-réseau doit être provisionné. Si 'false', le sous-réseau sera recherché. | `bool  ` | Non     | True   |

### mgmt_vsi_encrypt_auth
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| mgmt_vsi_encrypt_auth_source_service_name | Le nom du service qui sera autorisé à accéder au service cible. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services. | `string` | Non     | server-protect |
| mgmt_vsi_encrypt_auth_source_resource_instance_id | L'identifiant d'instance du service source. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte. | `string` | Non     | null   |
| mgmt_vsi_encrypt_auth_source_resource_type | Le type de ressource du service source. Cette valeur est utilisée pour définir les sous-types de services dans le catalogue de services. (e.g. flow-log-collector). | `string` | Non     | null   |
| mgmt_vsi_encrypt_auth_source_resource_group_id | ID du groupe de ressources de l'instance source | `string` | Non     | null   |
| mgmt_vsi_encrypt_auth_provision | L'autorisation doit-elle être fournie | `bool  ` | Non     | True   |
| mgmt_vsi_encrypt_auth_target_service_name | Le nom du service auquel le service source sera autorisé à accéder. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services. | `string` | Non     | hs-crypto |
| mgmt_vsi_encrypt_auth_target_resource_instance_id | L'identifiant d'instance du service cible. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte. | `string` | Non     | null   |
| mgmt_vsi_encrypt_auth_target_resource_type | Le type de ressource du service cible. Cette valeur est utilisée pour définir les sous-types de services dans le catalogue de services. (e.g. flow-log-collector). | `string` | Non    | null   |
| mgmt_vsi_encrypt_auth_roles | Une liste des rôles qui doivent être accordés sur le service cible. (e.g. Reader, Writer). | `string` | Non     | ["Reader"] |
| mgmt_vsi_encrypt_auth_source_service_account | GUID du compte où le service source est provisionné. Cette information est nécessaire pour autoriser l'accès au service sur plusieurs comptes. | `string` | Non     | null   |

### mgmt_kube_encrypt_auth
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| mgmt_kube_encrypt_auth_source_service_name | Le nom du service qui sera autorisé à accéder au service cible. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services. | `string` | Non     | containers-kubernetes |
| mgmt_kube_encrypt_auth_source_resource_instance_id | L'identifiant d'instance du service source. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte. | `string` | Non     | null   |
| mgmt_kube_encrypt_auth_source_resource_type | Le type de ressource du service source. Cette valeur est utilisée pour définir les sous-types de services dans le catalogue de services. (e.g. flow-log-collector). | `string` | Non     | null   |
| mgmt_kube_encrypt_auth_target_service_name | Le nom du service auquel le service source sera autorisé à accéder. Cette valeur est le nom du service tel qu'il apparaît dans le catalogue des services. | `string` | Non     | hs-crypto |
| mgmt_kube_encrypt_auth_target_resource_instance_id | L'identifiant d'instance du service cible. Cette valeur est requise si l'autorisation doit s'appliquer à une instance de service spécifique. Si cette valeur n'est pas fournie, l'autorisation s'appliquera au groupe de ressources ou au compte. | `string` | Non     | null   |
| mgmt_kube_encrypt_auth_target_resource_type | Le type de ressource du service cible. Cette valeur est utilisée pour définir les sous-types de services dans le catalogue de services. (e.g. flow-log-collector). | `string` | Non     | null   |
| mgmt_kube_encrypt_auth_roles | Une liste des rôles qui doivent être accordés sur le service cible. (e.g. Reader, Writer). | `string` | Non    | ["Reader"] |
| mgmt_kube_encrypt_auth_source_service_account | GUID du compte où le service source est provisionné. Cette information est nécessaire pour autoriser l'accès au service sur plusieurs comptes. | `string` | Non     | null   |

### management_vpc
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| management_vpc_name | Le nom de l'instance vpc | `string` | Non     |        |
| mgmt_name_prefix | Le préfixe du nom utilisé pour construire le nom s'il n'est pas fourni. S'il est utilisé, le nom sera `{name_prefix}-{label}` | `string` | Non   | devmgmt |
| ibmcloud_api_key | Le jeton d'api IBM Cloud | `string` | Oui    |        |
| management_vpc_provision | Variable indiquant que l'instance doit être provisionnée. S'il est faux, une instance existante sera recherchée. | `bool  ` | Non     | True   |
| management_vpc_address_prefix_count | Le nombre de ipv4_cidr_block | `number` | Non     | 0      |
| management_vpc_address_prefixes | Liste des blocs cidr ipv4 pour les préfixes d'adresse (par exemple ['10.10.10.0/24']). Si vous fournissez des blocs cidr, une valeur doit être fournie pour chacun des sous-réseaux. Si vous ne fournissez pas de blocs cidr pour chacun des sous-réseaux, les valeurs seront générées à l'aide de la commande {ipv4_address_count}. | `string` | No    n | []     |

### workload_vpc
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Oui    |        |
| workload_vpc_name | Le nom de l'instance vpc | `string` | Non     |        |
| workload_name_prefix | Le préfixe du nom utilisé pour construire le nom s'il n'est pas fourni. S'il est utilisé, le nom sera `{name_prefix}-{label}` | `string`| Non   | devwrk |
| ibmcloud_api_key | Le jeton d'api IBM Cloud| `string` | Oui    |        |
| workload_vpc_provision | Variable indiquant que l'instance doit être provisionnée. S'il est faux, une instance existante sera recherchée. | `bool  ` | Non     | True   |
| workload_vpc_address_prefix_count | Le nombre de ipv4_cidr_block | `number` | Non     | 0      |
| workload_vpc_address_prefixes | Liste des blocs cidr ipv4 pour les préfixes d'adresse (par exemple ['10.10.10.0/24']). Si vous fournissez des blocs cidr, une valeur doit être fournie pour chacun des sous-réseaux. Si vous ne fournissez pas de blocs cidr pour chacun des sous-réseaux, les valeurs seront générées à l'aide de la commande  | `string` | Non     | []     |

### mgmt_vpn_gateway and workload_vpn_gateway
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Oui    |        |
| ibmcloud_api_key | Le jeton d'api IBM Cloud | `string` | Oui    |        |
| tags | Étiquettes à appliquer au service | `string` | Non | [] |
| mode   | Le mode de fonctionnement optionnel de la passerelle VPN. Les valeurs valides sont route ou policy | `string` | Oui | null |


### mgmt_ssh_vsi and workload_ssh_vsi
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Oui    |        |
| ibmcloud_api_key | Le jeton d'api IBM Cloud | `string` | Oui    |   
| mgmt_name_prefix | Le préfixe du nom utilisé pour construire le nom s'il n'est pas fourni. S'il est utilisé, le nom sera `{name_prefix}-{label}` | `string` | Oui | devmgmt |
| mgmt_ssh_vsi_name | Optionel) Nom donné à l'instance de la clé ssh. S'il n'est pas fourni, il sera généré en utilisant prefix_name. | `string` | Non | "" |
| mgmt_ssh_vsi_label | (Optionel) Label utilisé pour l'instance. Il sera ajouté au préfixe name_prefix pour créer le nom si le nom n'est pas fourni.. | `string` | Non | scc |
| mgmt_ssh_vsi_public_key | La clé publique fournie pour la clé ssh. Si une chaîne vide est fournie, une nouvelle clé sera générée. | `string` | Oui | "" |
| mgmt_ssh_vsi_private_key | La clé privée fournie pour la clé ssh. Si une chaîne vide est fournie, une nouvelle clé sera générée. | `string` | Oui | "" |
| mgmt_ssh_vsi_rsa_bits | Le nombre de bits de la clé rsa, si elle est générée. | `number` | Oui | 3072 |



### mgmt_bastion_subnets
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Oui    |        |
| ibmcloud_api_key | Le jeton d'api IBM Cloud | `string` | Oui    |   
| mgmt_bastion_subnets__count | Le nombre de sous-réseaux qui doivent être provisionnés. | `number` | Oui | 2 |
| mgmt_bastion_subnets_label | Label pour les sous-réseaux créés | `string` | Oui | bastion |
| mgmt_bastion_subnets_zone_offset | Le décalage pour la zone où le sous-réseau doit être créé. Le décalage par défaut est 0, ce qui signifie que le premier sous-réseau doit être créé dans la zone xxx-1. | `number` | Oui | 0 |
| mgmt_bastion_subnets_ipv4_cidr_blocks | Liste des blocs cidr ipv4 pour les sous-réseaux qui seront créés (par exemple ['10.10.10.0/24']). Si vous fournissez des blocs cidr, une valeur doit être fournie pour chacun des sous-réseaux. Si vous ne fournissez pas de blocs cidr pour chacun des sous-réseaux, les valeurs seront générées en utilisant la valeur {ipv4_address_count}. | `string` | Oui | [] |
| mgmt_bastion_subnets| La taille du bloc ipv4 cidr qui doit être alloué au sous-réseau. Si {ipv4_cidr_blocks} est fourni, cette valeur est ignorée. | `number` | Oui | 256 |
| mgmt_bastion_subnets_provision | Variable indiquant que le sous-réseau doit être provisionné. Si 'false', le sous-réseau sera recherché. | `bool` | Oui | true |
| mgmt_bastion_subnets_acl_rules | Liste des règles à définir sur la liste de contrôle d'accès du sous-réseau | `string` | Oui | [] |


### workload_subnets or mgmt_subnets
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Oui    |        |
| ibmcloud_api_key | Le jeton d'api IBM Cloud | `string` | Oui    |   
| workload_subnets__count | Le nombre de sous-réseaux qui doivent être provisionnés. | `number` | Oui | 3 |
| workload_subnets_label | Label pour les sous-réseaux créés | `string` | Oui | workload |
| mgmt_subnets_label | Label pour les sous-réseaux créés | `string` | Oui | mgmt |
| workload_subnets_zone_offset | Le décalage pour la zone où le sous-réseau doit être créé. Le décalage par défaut est 0, ce qui signifie que le premier sous-réseau doit être créé dans la zone xxx-1. | Oui  | 0 |
| workload_subnets_ipv4_cidr_blocks | Liste des blocs cidr ipv4 pour les sous-réseaux qui seront créés (par exemple ['10.10.10.0/24']). Si vous fournissez des blocs cidr, une valeur doit être fournie pour chacun des sous-réseaux. Si vous ne fournissez pas de blocs cidr pour chacun des sous-réseaux, les valeurs seront générées en utilisant la valeur {ipv4_address_count}. | `string` | Oui | [] |
| workload_subnets_ipv4_address_count | La taille du bloc ipv4 cidr qui doit être alloué au sous-réseau. Si {ipv4_cidr_blocks} est fourni, cette valeur est ignorée. | `number` | Oui | 256 |
| workload_subnets_provision | Variable indiquant que le sous-réseau doit être provisionné. Si 'false', le sous-réseau sera recherché. | `bool` | Oui | true |
| workload_subnets_acl_rules | Liste des règles à définir sur la liste de contrôle d'accès du sous-réseau | `string` | Oui | [] |

### workload_vpe_subnets or mgmt_vpe_subnets
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Oui    |        |
| ibmcloud_api_key | Le jeton d'api IBM Cloud | `string` | Yes    |   
| workload_vpe_subnets__count | Le nombre de sous-réseaux qui doivent être provisionnés. | `number` | Oui | 3 |
| workload_vpe_subnets_label | Label pour les sous-réseaux créés | `string` | Oui | workload |
| mgmt_vpe_subnets_label | Label pour les sous-réseaux créés | `string` | Oui | vpe |
| workload_vpe_subnets_zone_offset |Le décalage pour la zone où le sous-réseau doit être créé. Le décalage par défaut est 0, ce qui signifie que le premier sous-réseau doit être créé dans la zone xxx-1. | `number` | Oui  | 0 |
| workload_vpe_subnets_ipv4_cidr_blocks | Liste des blocs cidr ipv4 pour les sous-réseaux qui seront créés (par exemple ['10.10.10.0/24']). Si vous fournissez des blocs cidr, une valeur doit être fournie pour chacun des sous-réseaux. Si vous ne fournissez pas de blocs cidr pour chacun des sous-réseaux, les valeurs seront générées en utilisant la valeur {ipv4_address_count}. | `string` | Oui | [] |
| workload_vpe_subnets_ipv4_address_count | La taille du bloc ipv4 cidr qui doit être alloué au sous-réseau. Si {ipv4_cidr_blocks} est fourni, cette valeur est ignorée. | `number` | Oui | 256 |
| workload_vpe_subnets_provision | Variable indiquant que le sous-réseau doit être provisionné. Si 'false', le sous-réseau sera recherché. | `bool` | Oui | true |
| workload_vpe_subnets_acl_rules |  Liste des règles à définir sur la liste de contrôle d'accès du sous-réseau | `string` | Oui | [] |


### workload_vpn_subnets or mgmt_vpn_subnets
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Non     | us-south | 
| ibmcloud_api_key |   Le jeton d'api IBM Cloud | `string` | Yes |    |  
| workload_vpn_subnets__count | Le nombre de sous-réseaux qui doivent être provisionnés. | `number` | Oui | 1 |
| workload_vpn_subnets_label | Label pour les sous-réseaux créés | `string` | Oui | vpn |
| workload_vpn_subnets_zone_offset | Le décalage pour la zone où le sous-réseau doit être créé. Le décalage par défaut est 0, ce qui signifie que le premier sous-réseau doit être créé dans la zone xxx-1. | `number` | Oui  | 0 |
| workload_vpn_subnets_ipv4_cidr_blocks | Liste des blocs cidr ipv4 pour les sous-réseaux qui seront créés (par exemple ['10.10.10.0/24']). Si vous fournissez des blocs cidr, une valeur doit être fournie pour chacun des sous-réseaux. Si vous ne fournissez pas de blocs cidr pour chacun des sous-réseaux, les valeurs seront générées en utilisant la valeur {ipv4_address_count}. | `string` | Oui | [\"10.40.30.0/24\"] |
| workload_vpn_subnets_ipv4_address_count | La taille du bloc ipv4 cidr qui doit être alloué au sous-réseau. Si {ipv4_cidr_blocks} est fourni, cette valeur est ignorée. | `number` | Oui | 256 |
| workload_vpn_subnets_provision | Variable indiquant que le sous-réseau doit être provisionné. Si 'false', le sous-réseau sera recherché. | `bool` | Oui | true |
| workload_vpn_subnets_acl_rules | List of rules to set on the subnet access control list | `string` | Yes | [] |
| mgmt_subnets_acl_rules| Liste des règles à définir sur la liste de contrôle d'accès du sous-réseau | `string` | Oui | [{\"name\":\"ingress-all\",\"action\":\"allow\",\"direction\":\"inbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"},{\"name\":\"egress-all\",\"action\":\"allow\",\"direction\":\"outbound\",\"source\":\"0.0.0.0/0\",\"destination\":\"0.0.0.0/0\"}] |

### mgmt_vpe_containerregistry
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Non     | us-south | 
| ibmcloud_api_key |  Le jeton d'api IBM Cloud  | `string` | Oui |    |  
| mgmt_name_prefix | Le préfixe du nom utilisé pour construire le nom s'il n'est pas fourni. S'il est utilisé, le nom sera `{name_prefix}-{label}`| `string` | Oui | devmgmt |
| mgmt_vpe_containerregistry_crn | CRN du registre des conteneurs basé sur la région | `string` | Oui | crn:v1:bluemix:public:container-registry:us-south:::endpoint:vpe.us-south.container-registry.cloud.ibm.com |

### workload_vpe_cos or mgmt_vpe_cos
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Non     | us-south | 
| ibmcloud_api_key | Le jeton d'api IBM Cloud | `string` | Oui |    |  
| workload_name_prefix | Le préfixe du nom utilisé pour construire le nom s'il n'est pas fourni. S'il est utilisé, le nom sera `{name_prefix}-{label}` | `string` | Oui | devwrk |
| mgmt_name_prefix | Le préfixe du nom utilisé pour construire le nom s'il n'est pas fourni. S'il est utilisé, le nom sera  `{name_prefix}-{label}`| `string` | Oui | devmgmt |


### mgmt_vpc_vsi or workload_vpc_vsi
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Non     | us-south | 
| ibmcloud_api_key | Le jeton d'api IBM Cloud | `string` | Oui |    |   
| kms_enabled | kms key devrit être activé | `bool` | Oui | true |


### ibm_transit_gateway
|Nom de la variable | Description  | Type   | Requis | Défaut |
|--------|--------------|--------|--------|--------|
| region | Localisation géographique de la ressource (e.g. us-south, us-east) | `string` | Non     | us-south |
| ibm_transit_gateway_name | Le nom qui doit être utilisé pour le service, en particulier lors de la connexion à un service existant. S'il n'est pas fourni, le nom sera proposé sera {name prefix}-{service} | `string` | Non | "" |
| name_prefix | Le nom du préfixe pour le service. The IBM Cloud api keyS'il n'est pas fourni, le nom du groupe de ressources sera utilisé par défaut | `string`| Non | "" |
| ibmcloud_api_key | Le jeton d'api IBM Cloud | `string` | Yes |    |     
