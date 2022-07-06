# Customer Empathy Workshop

This repository holds the Terraform configuration files you will need to get started in the customer empathy session on state migration!

## What does this provision?

These configuration files produce the base starting point of our (INSERT FAKE COMPANY NAME) infrastructure:

- An S3 Bucket to store our Terraform statefile.
- A DynamoDB table to manage our Terraform state locking.
- A simple VPC 
- Two NAT Gateways
- Two EC2 instances in that VPC that will serve as our example database and web application servers.

## Setup

### Doormat credentials

(More information is needed here to get everything set up)

### Provisioning

1. Clone this repository and run `terraform init`.

2. After initializing your root module, we'll need to modify our configuration to authenticate the AWS Terraform provider.

In `provider.tf`, modify the provider block to reference your Doormat credentials. There are many different ways to authenticate the provider so feel free to choose a method that suits you best. 

```hcl
provider "aws" {
  region = "us-east-1"
  # Add your credentials here
  access_key = "<YOUR-DOORMAT-ACCESS-KEY>"
  secret_key = "<YOUR-DOORMAT-SECRET-KEY"
  token = "<YOUR-DOORMAT-SESSION-TOKEN>"
  # OR
  # Set them as env vars, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN
  # OR
  # profile = "customer-empathy"
  # For more information: https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration
}
```

3. Once you've configured your provider, we can go ahead and run `terraform plan` to see all the new resources that will be created. Furthermore, it will help us catch any errors should they arise.

4. Once `terraform plan` is successful, we can go ahead and apply our desired infrastructure changes: `terraform apply` and enter `yes` when prompted.

5. This may take a while, so sit back and relax! 

6. Once the changes have been applied we'll have our statefile stored locally. You'll notice there is an output in the form:
```
Outputs:

bucket_name = "ce-session-tfstate-bucket-7289"
```

Well use this value to specify our bucket in the S3 backend configuration. You might have noticed the backend configuration is commented out in `main.tf`. In order to migrate our statefile to an S3 bucket we'll need to uncomment that block and replace `{RANDOM_NUMBER_HERE}` with the integer value of the output. 

7. Run `terraform init` again, this time Terraform will notice that there's been a change in the backend configuration from `local` to `S3`. Enter `yes` when asked if Terraform should perform a state migration.

8. Once completed you have now migrated your Terraform statefile to S3 and you are ready to begin the customer empathy session exercise.
