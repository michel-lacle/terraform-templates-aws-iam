# terraform-templates-aws-iam

This repo provides terraform code for an example AWS
IAM configuration for a group with two users where each
user inherits the group policy.

In this case we have two developers(developer1 & developer2), who
are part of the developers group, and the developers
are only allowed to "Describe" the EC2 resources.