terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws   = ">=3.57.0"
    local = ">=2.1.0"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "dhiego"
}
