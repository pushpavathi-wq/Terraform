terraform {
  backend "s3" {
    bucket         = "pushpavathi-terraform-state"
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"

  }
}
