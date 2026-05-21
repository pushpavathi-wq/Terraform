terraform {
  backend "s3" {     # we can write this backend config in providers file also
    bucket         = "my-tf-daws82s-bucket"
    key            = "terraform.tfstate"   # unique,path to the bucket
    region = "us-east-1"
    dynamodb_table = "tf_state_table" # view the  state lock in tables-explore more items
  }
}


# for now the table and s3 bucket created manually through UI