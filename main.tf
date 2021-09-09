terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws   = ">=3.57.0"
    local = ">=2.1.0"
  }
  backend "s3" {
    bucket = "terraformbucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "dhiego"
}

module "main-vpc" {
  source = "./modules/vpc"
  prefix = var.prefix
}

module "main-eks" {
  source         = "./modules/eks"
  vpc_id         = module.main-vpc.vpc_id
  subnet_ids     = module.main-vpc.subnet_ids
  prefix         = var.prefix
  cluster_name   = var.cluster_name
  retention_days = var.retention_days
  desired_size   = var.desired_size
  max_size       = var.max_size
  min_size       = var.min_size
}
