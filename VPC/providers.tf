provider "aws" {
    region = local.region
    profile = "default"
}

locals {
  region = "eu-west-1"
}
