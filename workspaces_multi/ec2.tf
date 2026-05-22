resource "aws_instance" "web" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = terraform.workspace == "prod" ? "t3.medium" : "t2.micro"

  tags = {
    Environment = terraform.workspace
    Name = "pushpa"
  }
}

# workspace is ENVs