resource "aws_instance" "instance1" {
    count = length(var.names)  # this takes names from variable
    ##count = 3    # creates 3 instances 
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t2.micro"

    tags = {
      Name = var.names[count.index]
    }

}





