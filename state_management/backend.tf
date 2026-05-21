terraform {
  backend "s3" {     # we can write this backend config in providers file also
    bucket         = "my-tf-daws82s-bucket"
    key            = "terraform.tfstate"
    dynamodb_table = "tf_state_table"
  }
}