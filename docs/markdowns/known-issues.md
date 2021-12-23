
## ROKS pattern:

1. Plan after apply: 
    - ROKS module fails to set the correct value of kube_version in the resource and thus the provider crashes.
      - Workaround: A workaround of setting 4.6_openshift in the module's main.tf using "sed" has already been added to pattern-apply task
    - VPE gateway expects a temporary folder to be present on re-run after apply.
      - Workaround: A workaround of creation of fake temporary folder has already been added to pattern-apply task
2.  VPE gateway causes ROKS workers to not deploy.
      - Workaround: A delay of 5 minutes has been added after deployment of ROKS clusters before VPE gateways are deployed. To add the delay, we also had to remove the provider.tf file from the module code in "terraform-init" step of "pattern-apply" task.
3. Destruction of pattern 
(subnet deletion): 
    - When the pattern is destroyed, and hit an error that subnet cannot be destroyed when in use. This happens because the deletion of some resources takes some time after the deletion is ordered. Thus, the subnet will be in use until those resources are deleted.
      - Workaround: Give it a few minutes (about 5 minutes) and rerun destroy.
(HPCS key deletion): 
    - You might fail to delete HPCS keys. This happens because HPCS thinks that the key is being used by the resource which is already ordered to destroy. We are working with HPCS team to resolve this.
        - Workaround: Open an issue with HPCS team. We think that it might be happening because the buckets using the key and ordered to delete might still not be reclaimed for 30 days.