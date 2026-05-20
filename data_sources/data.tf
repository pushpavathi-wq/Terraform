data "aws_ami" "exampleami" {
  most_recent      = true
  owners = ["973714476881"]
  

# below are the filters from AMI from an instance
  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}