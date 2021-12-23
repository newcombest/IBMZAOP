## Pattern Destroy 

Destruction of pattern 

1. Running Destroy in Toolchain
  - To cleanup or destroy the resources created through toolchain, we need to set `terraform-cmd` to `destroy` in `Provision` pipeline under environment properties and run the pipeline.
         
2. Running Destroy in local
  - Terraform destroy would work as normal and clean up the resources under different folders with `terraform destroy` command.


### Known issues

HPCS key deletion: 
 - Sometimes you might fail to delete HPCS keys. This happens because HPCS thinks that the key is being used by the resource which is already ordered to destroy. We are working with HPCS team to resolve this.
 
    Workaround: Open an issue with HPCS team. We think that it might be happening because the buckets using the key and ordered to delete might still not be reclaimed for 30 days.
 

