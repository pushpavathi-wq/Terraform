terraform {
  required_providers {
    aws={
      version = "6.43.0"      # here if we give source first,,,,it can recognize version, it fails
      source = "hashicorp/aws"
        
    }
  }
}

provider "aws" {
    region = "us-east-1"
  
}