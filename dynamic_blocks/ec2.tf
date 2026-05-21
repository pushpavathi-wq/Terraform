resource "aws_security_group" "firstgroup" {
    name = "firstgroup"
    description = "Allow all inbound and outbound traffic"

# Dynamic resource block
    dynamic "ingress" {      
        for_each = var.ingress_port

        content {
            from_port = ingress.value["from_port"]
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
      
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" # all protocols
        cidr_blocks = ["0.0.0.0/0"]   # allow all traffic
    }
   

    tags = {
        name = "firstgroup"
    }
  
}



resource "aws_instance" "instance1" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.firstgroup.id]

    tags = {
        name = "practice"
        purpose = "practice_purpose"
      
    }
}