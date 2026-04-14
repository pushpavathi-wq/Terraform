resource "aws_s3_bucket" "runnerbucket" {
  region = "eu-central-1"

  tags = {
    Name        = "My bucket"

  }
}