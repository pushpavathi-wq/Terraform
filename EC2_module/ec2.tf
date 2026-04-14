
# AWS Instance
resource "aws_instance" "newinstance" {
  ami                    = "ami-0ec10929233384c7f" # Replace with a valid AMI ID
  instance_type          = "t3.micro"
  vpc_security_group_ids = [var.sg_id]
  

  tags = {
    Name = "TERRAFORM"
  }
}

