terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # tells the terraform to download provider from hashicorp
      version = "5.84.0" # use this version, so it won't break and ensures smooth deployments
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"

}