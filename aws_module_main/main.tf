resource "aws_instance" "moduleinstance" {
    ami = var.ami_id
    instance_type = var.instance_type

    tags = {
      Name = "pushpa"
      Purpose = "Devops practice"
      environment = "dev"
    }
}