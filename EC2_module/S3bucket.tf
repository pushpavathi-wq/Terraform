resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"
  region = "eu-central-1"

  tags = {
    Name        = "My bucket"

  }
}