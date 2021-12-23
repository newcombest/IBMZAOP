# Hyper Protect Crypto Services Initialization

The first step is provision a Hyper Protect Crypto Services instance into the nominated account and initialize the key ceremony. You can do this with the following automation. We recommend to follow the product docs to perform the quick initialization.

[Hyper Protect Cyrpto Service Documentation](https://cloud.ibm.com/docs/hs-crypto?topic=hs-crypto-get-started)

For proof of technology environments we recommend using the `auto-init` feature. [Auto Init Documentation](https://cloud.ibm.com/docs/hs-crypto?topic=hs-crypto-initialize-hsm-recovery-crypto-unit)  

#### Generate HPCS root key

Once the HPCS instance has been initialized create a Root Key.

**HPCS instance and bucket using HPCS key should be in same region**

1. Open the **Resources** view in IBM Cloud console - <https://cloud.ibm.com/resources>
2. Expand the **Services** twisty and click on the Hyper Protect Crypto Service (HPCS) instance
3. In HPCS instance page, go to **Key management service keys** in the left menu
4. Click on **Add key** to create a new root key
5. In **Add key** page, provide the details
    - **Key type** : `Root key`
    - **Key name** : Enter a descriptive name for your root key
    - **Key ring ID**: choose `default`
    - **Expiration date**: Chose a date and time
6. Click **Create**
7. Copy the value from **ID field** and save it somewhere. This value will be needed later.
