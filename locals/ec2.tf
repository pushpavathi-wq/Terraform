resource "aws_instance" "instance1" {
  ami = "ami-0220d79f3f480ecf5"
  instance_type = local.instance_type

  tags = {
    Name = "pushpas"
  }
}

