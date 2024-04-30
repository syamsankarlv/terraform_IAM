# AWS IAM_User Creation Using Terraform


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Using this Terraform code, we can provision AWS IAM users and attach policies to them.

## Contents

- **[Introduction](Introduction)**
- **[Prerequisites](Prerequisites)**
- **[Usage](Usage)**
- **[Explanation](Explanation)**
- **[Resources](Resources)**

## Introduction

This Terraform configuration allows for the creation of IAM users in AWS and the attachment of a predefined policy to those users. IAM (Identity and Access Management) in AWS enables you to securely control access to AWS services and resources.

## Prerequisites
Before using this Terraform configuration, ensure you have the following:

 - Passing IAM credentials through environment variables ensures that Terraform can securely access them without explicitly storing them in its configuration. 

 - Terraform automatically fetches these credentials from the environment variables during its execution.


## Usage

- Update the variables.tf file to specify the usernames for the IAM users you want to create.
- Initialize the Terraform configuration by running  `terraform init`.
- Review the execution plan by running `terraform plan`.
- If the plan looks good, apply the changes by running `terraform apply`.
- After applying the changes, Terraform will output the details of the created IAM users.



## Explanation

### IAM User Creation

The `aws_iam_user` resource block is responsible for creating IAM users in AWS. It iterates over the usernames specified in the var.username variable and creates a user for each.


### Policy Creation and Attachment 

The `aws_iam_policy` resource block defines a policy named `ec2_policy`, which allows describing EC2 instances. It grants the necessary permissions using a JSON-encoded policy document.

The aws_iam_policy_attachment resource block attaches the `ec2_policy` to the IAM users created earlier. It iterates over each IAM user and attaches the policy to them. The lifecycle block ensures that the attachment is created before any existing attachments are destroyed, to prevent downtime.

## OUTPUT SNAPSHOTS

<img width="510" alt="Screenshot_1" src="https://github.com/syamsankarlv/terraform-aws_vpc/assets/37361340/0c8390c1-4b2b-42de-b487-37a172a222f7">

<img width="785" alt="Screenshot_2" src="https://github.com/syamsankarlv/terraform-aws_vpc/assets/37361340/578c33f9-30ac-4dd0-ba71-28782f6118eb">

<img width="623" alt="Screenshot_3" src="https://github.com/syamsankarlv/terraform-aws_vpc/assets/37361340/c69b4689-af46-4940-a19c-47a3ef9eccf0">

<img width="650" alt="Screenshot_4" src="https://github.com/syamsankarlv/terraform-aws_vpc/assets/37361340/0272d5cb-dea5-4399-a693-123fbf292f96">


## Resources

- **[AWS IAM Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)**

- **[Terraform Documentation](https://developer.hashicorp.com/terraform/tutorials/aws/aws-iam-policy)**



