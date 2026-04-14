terraform {
  backend "s3" {
    bucket = "runnerbucket"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}