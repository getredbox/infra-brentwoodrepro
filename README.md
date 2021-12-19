# infra-brentwoodrepro

## Required Artifacts
The following are required to run the infrastructure:
- vars.tf: used to store private variables.
- backend_s3.tfvars: contains S3 backend config.
- git clone https://github.com/hashicorp/learn-terraform-rds.git ./other/learn-terraform-rds

## Init project
Run the following command to initialize project:
``` terraform init -backend-config backend_s3.tfvars ```

