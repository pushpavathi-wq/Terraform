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
        name = "firstgroup"
    }
  
}



resource "aws_instance" "instance1" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.firstgroup.id]

    tags = {
        Name = "practice"
        purpose = "practice_purpose"
      
    }

    provisioner "local-exec" {
        command = "echo ${self.private_ip} > provisioner.txt" # self is a keyword 
      
    }


    connection {   # before executing commands in remote machine we need to check connection and login to server
      type = "ssh"
      user = "ec2-user"
      password = "Devops321"
      host = self.public_ip
    }

    provisioner "remote-exec" {   
        inline = [ 
            "sudo dnf install httpd -y",  # these are installed inside server like additin commands while creating instance
            "sudo systemctl start httpd "
         ]
      
    }
}
