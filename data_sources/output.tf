
#asking terraform to print something in output
# we can check the latest AMI here
output "ami_id" {
    value = data.aws_ami.exampleami.id
  
}