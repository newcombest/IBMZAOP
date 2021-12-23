# Terraform Installation

Note: The instructions below have been taken from the [IBM Cloud manual](https://cloud.ibm.com/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-getting-started) with some additional updates.

## Install Terraform Executable

Terraform on IBM Cloud enables predictable and consistent provisioning of IBM Cloud platform. These instructions require you to run terraform locally on your desktop machine.

1. Create `terraform` folder on your local machine and navigate to the folder.
2. Download the [Terraform code](https://releases.hashicorp.com/terraform) that you want. The IBM Cloud Provider plug-in for Terraform currently supports Terraform versions 0.12.x, 0.13.x, and 0.14.x only. Make sure to select a supported Terraform version.
3. Extract the Terraform zip file and copy the files to your `terraform` directory
4. Set the environment `PATH` to include the location of your terraform files.

    ```{bash}
    export PATH=$PATH:$HOME/terraform
    ```

    On Windows, enter in the search bar `edit environment` to open up _Edit environment variables for your account_ and the add the directory containing the `terraform` executable to the environment variable `Path`. Restart your PowerShell session before continuing.
    
    On Mac OS- Install Terraform 
The easiest and quickest way to install Terraform is using Homebrew.

  `  $ brew install terraform<version> `
Or Manually if the latest version is not ideal for your needs
 - Download terraform for macos
Note: Terraform is packaged as a zip archive, so after downloading Terraform, unzip the package. Terraform runs as a single binary named terraform. Any other files in the package can be safely removed and Terraform will still function

 - Extract files from the zip to `$HOME/Downloads/terraform` for example.
	
 - The final step is to make sure that the terraform binary is available on the PATH.
	
 - Copy binary to a place in the path such as /usr/local/bin/terraform
    
    

5. Verify that the installation is successful by running the 'terraform' command. The example below is for Windows but the output is similar on Linux or MacOS.

    ```{powershell}
    C:\Users\UserName\terraform> terraform
    Usage: terraform [global options] <subcommand> [args]

    The available commands for execution are listed below.
    The primary workflow commands are given first, followed by
    less common or more advanced commands.

    Main commands:
      init          Prepare your working directory for other commands
      validate      Check whether the configuration is valid
      plan          Show changes required by the current configuration
      apply         Create or update infrastructure
      destroy       Destroy previously-created infrastructure

    All other commands:
      console       Try Terraform expressions at an interactive command prompt
      fmt           Reformat your configuration in the standard style
      force-unlock  Release a stuck lock on the current workspace
      get           Install or upgrade remote Terraform modules
      graph         Generate a Graphviz graph of the steps in an operation
      import        Associate existing infrastructure with a Terraform resource
      login         Obtain and save credentials for a remote host
      logout        Remove locally-stored credentials for a remote host
      output        Show output values from your root module
      providers     Show the providers required for this configuration
      refresh       Update the state to match remote systems
      show          Show the current state or a saved plan
      state         Advanced state management
      taint         Mark a resource instance as not fully functional
      test          Experimental support for module integration testing
      untaint       Remove the 'tainted' state from a resource instance
      version       Show the current Terraform version
      workspace     Workspace management

    Global options (use these before the subcommand, if any):
      -chdir=DIR    Switch to a different working directory before executing the
                    given subcommand.
      -help         Show this help output, or the help for a specified subcommand.
      -version      An alias for the "version" subcommand.
    ```

## Configure IBM Cloud Provider Plug-In

After the Terraform CLI installation is complete, you must set up and configure the IBM Cloud Provider plug-in for Terraform

1. In your `terraform` installation directory, create a `projectname` folder on your local machine and navigate to the folder.

2. Create a `versions.tf` file with the following content. In this file, specify the IBM Cloud Provider plug-in version that you want to use with the version parameter. If no version is specified, Terraform on IBM Cloud automatically uses the latest version.

    For a list of supported versions, see the [IBM Cloud Provider plug-in releases](https://github.com/IBM-Cloud/terraform-provider-ibm/releases). The version is specified in the following format <MAJOR_VERSION>.<MINOR_VERSION>.<PATCH>. To make it simple to start, set `version = ""`.

    ```{bash}
    terraform {
       required_providers {
          ibm = {
             source = "IBM-Cloud/ibm"
             version = "<provider_version>"       
             }
        }
    }
    ```

3. Create or retrieve an [IBM Cloud API key](https://cloud.ibm.com/docs/account?topic=account-userapikey#create_user_key). The API key is used to authenticate with the IBM Cloud platform and to determine your permissions for IBM Cloud services.

4. Create a variables file that is named `terraform.tfvars` and specify the IBM Cloud API key that you retrieved. (Variables that are defined in the `terraform.tfvars` file are automatically loaded by Terraform when the IBM Cloud Provider plug-in is initialized)

    ```bash
    ibmcloud_api_key = "<ibmcloud_api_key>"
    ```

    Note: As the file contains an API, if you are using a configuration system such as GitHub add this file to the `.gitignore` file.

5. Create a provider configuration file that is named `provider.tf`. Use this file to configure the IBM Cloud Provider plug-in with the IBM Cloud API key from your `terraform.tfvars` file.

    ```{bash}
    variable "ibmcloud_api_key" {}

    provider "ibm" {
        ibmcloud_api_key   = var.ibmcloud_api_key
    }
    ```

6. Check you have a directory with three files. On Windows, it may have added a `.txt` on the end of filename and you will need to rename the files.

    - `provider.tf`
    - `terraform.tf`
    - `versions.tf`
