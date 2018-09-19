[![Build Status](https://travis-ci.org/rafaelbattesti/TerraformTutorials.svg?branch=master)](https://travis-ci.org/rafaelbattesti/TerraformTutorials)

# *Terraform*
---

#### Configuration
1. Download extract, place, add to `PATH` and create Symlink in `/usr/bin`

#### Resource Management
1. `terraform init`                     - To initialize the workspace
2. `terraform plan`                     - Runs `main.tf` as a plan and describes changes
3. `terraform apply`                    - Runs `main.tf` and apply changes to the real Cloud Provider
4. `terraform show`                     - Shows the current status of your deployment
5. `terraform output`                   - Queries all the latest outputs from applied plan
6. `terraform output <output_name>`     - Queries for the specific output

    ```
    $ ping $(terraform output public_dns)
    ```

7. `terraform console`                  - Initiates an interactive CLI (exit to quit)
8. `terraform fmt`                      - Format configuration files in the workspace
9. `$ export TF_VAR_<var_name>`         - Makes variables available to the environment
10. `$ terraform plan -var var=<value>` - Create variable during plan execution

Terraform always searches for a file named `terraform.tfvars`, or specify by using `terraform plan -var-file=foo.tfvars`

#### Code organization

Terraform parses configuration by appending objects' declaration lexicographicaly - **NON-RECURSIVE**!

##### By Resource
1. `instances.tf`
2. `load-balancers.tf`
3. `security-groups.tf`

##### By functionality
1. `main.tf`
2. `input.tf`
3. `output.tf`

#### HCL Syntax
##### Top level keywords

These keywords can be specified multiple times in the configuration file

1. `provider`
2. `variable`
3. `resource`
4. `output`
5. `module`
6. `data`

Heredocs are supported for descriptions, i.e.
```
variable "thing" {  
    description = <<EOF
This is
a multiline
string
EOF
}
```
