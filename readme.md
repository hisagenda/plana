# Creating an EKS cluster and a VPC using terraform

# - Summary:

- Create code for deploying a VPC in AWS with 2 public and 2 private subnets.

- Create code for deploying an EKS cluster in AWS, which will use the VPC created in the previous step. The cluster must have 2 nodes, using instance type t3a.large. The nodes must be on the private subnets only.

# - Prerequisites and tools:

1. Terraform : https://learn.hashicorp.com/terraform/getting-started/install.html
2. AWS IAM Account API Keys (Access Key & Secret Key)
3. AWS CLI : https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
4. AWS Subscription and Code Editor of choice

# - Installation Steps:

- To install terraform If you do not already have it installed, I will recommend you go through the link here - https://learn.hashicorp.com/terraform/getting-started/install.html
- You can create an IAM User in your AWS subscription using Terraform or the Portal. To get started using the portal - https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html .  After following the steps you will have an Access key and secret which I will advise you save in a credential manager or somewhere safe
- For the setup I used Vs Code. Any code editor will work fine
- To get started run "AWS configure" on a terminal locally and provide your access and secret keys. 

# - Code

- I started working on our VPC, and decided on the quickest way to get our VPC module up and running. Luckily AWS provided a VPC module which accepets inputs. https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
- Also create a providers.tf File along with the necessary provide. https://registry.terraform.io/providers/hashicorp/aws/latest/docs. run Terraform Init.
- Create a main.tf as well as versions.tf which will contain the core of our code.
- Specify the various inputs needed and ensure to take note of the requirements
- Proceed to run a terraform Validate to confirm your syntax. Afterwards we can run a terraform plan and apply after confirming we have the requirements
- This will create our resources which will be specified then on the portal and you can proceed to confirm
- I ensured that we have at least to AZ's for the EKS availabilty as it is a reuiremt
- On the outputs we will get our required VPC_id and subnets

- For the EKS as well, I created a different folder and workspace.
- I used the EKS Module: https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
- Also create a providers.tf File along with the necessary provide. https://registry.terraform.io/providers/hashicorp/aws/latest/docs. run Terraform Init.
- Create a eks-cluster.tf as well as versions.tf which will contain the core of our code as above. We would also need outputs as well as security groups
- We specified our Kubernetes provider in EKS.tf # https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster#optional-configure-terraform-kubernetes-provider
- Specify the various inputs needed and ensure to take note of the requirements
- Proceed to run a terraform Validate to confirm your syntax. Afterwards we can run a terraform plan and apply after confirming we have the requirements
- This will create our resources which will be specified then on the portal and you can proceed to confirm


# - Summary

-  Code has necessary comments in portions where some explanation may be needed on code use
-  Code can be deployed to AWS, however if we wanted to deploy to any other provider we would need to make changes to the providers 
-  State files are stored locally for this project, however for a production deployment I would advise to use a File share on the cloud
-  To persist variable values, create a “terraform.tfvars ” file, and assign variables within this file. This could be used instead of AWS configure on the profile


# Tip: if you are looking for deleting the resource, terraform destroy will clean up all the resources created for you.


- Thanks for taking out time to read! if you have anything to add please send a response or add a note!


# -  Author email:  abiola.kayode@gmail.com






