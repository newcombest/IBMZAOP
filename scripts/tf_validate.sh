#!/bin/bash

cd terraform/pattern
set +e
terraform init -backend=false > /dev/null 2>&1
set -e

# Workaround to delete the provider.tf files
echo "Running the workaround"
rm -f .terraform/modules/mgmt_vpe_cos/provider.tf
rm -f .terraform/modules/workload_vpe_cos/provider.tf
rm -f .terraform/modules/workload2_vpe_cos/provider.tf
rm -f .terraform/modules/workload3_vpe_cos/provider.tf
rm -f .terraform/modules/mgmt_vpe_containerregistry/provider.tf
rm -f .terraform/modules/workload_vpe_containerregistry/provider.tf
rm -f .terraform/modules/workload2_vpe_containerregistry/provider.tf
rm -f .terraform/modules/workload3_vpe_containerregistry/provider.tf
rm -f .terraform/modules/mgmt_vpc_vsi/provider.tf
rm -f .terraform/modules/workload_vpc_vsi/provider.tf
rm -f .terraform/modules/workload2_vpc_vsi/provider.tf
rm -f .terraform/modules/workload3_vpc_vsi/provider.tf
echo "END - Running the workaround"
# END - Workaround to delete the provider.tf files

terraform init -backend=false

terraform validate
