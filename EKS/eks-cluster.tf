locals {
  region = "eu-west-1"
}


module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = "abby_cluster"
  cluster_version = "1.20"
  subnets         = [
  local.subnet1,
  local.subnet2,
]

  vpc_id = local.vpc1

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t3a.large"
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      asg_desired_capacity          = 1
    },
    {
      name                          = "worker-group-2"
      instance_type                 = "t3a.large"
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = 1
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

locals {
  subnet1 = "subnet-08bcc65992ba08ca5"
  subnet2 = "subnet-08bd467f0968b797e"
  vpc1 = "vpc-03aed24c5757291ba"
}

#alternatively could create a locals.tf file for the locals