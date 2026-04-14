terraform {
  backend "s3" {
    bucket = "runnerbucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}