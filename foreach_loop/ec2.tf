resource "aws_security_group" "firstgroup" {
    name = "firstgroup"
    description = "Allow all inbound and outbound traffic"


    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        name = "group"
    }
  
}



resource "aws_instance" "instance1" {
    for_each = var.instances
    ami = "ami-0220d79f3f480ecf5"
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.firstgroup.id]

    tags = {
        name = "each.key"
        purpose = "practice_purpose"
      
    }
}