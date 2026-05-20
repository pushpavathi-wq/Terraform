resource "aws_instance" "data_instance" {
    instance_type = var.type
    ami = data.aws_ami.exampleami.id
    


    tags = {
      Name = "pushpa"
      purpose = "practice"
    }
  
}

