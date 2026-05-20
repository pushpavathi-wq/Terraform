resource "aws_s3_bucket" "daws82s_fun" {
  bucket = "daws82stfbuc"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}