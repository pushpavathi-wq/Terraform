resource "aws_security_group" "firstgroup" {
    name = "firstgroup"
    description = "Allow all inbound and outbound traffic"


    ingress {
        from_port = var.from_port
        to_port = var.to_port
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
        name = "firstgroup"
    }
  
}



resource "aws_instance" "instance1" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.firstgroup.id]

    tags = {
        name = "practice"
        purpose = "practice_purpose"
      
    }
}