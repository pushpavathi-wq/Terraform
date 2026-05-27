# resource "aws_security_group" "sg" {
#   name        = "${var.project_name}-${var.environment}-sg"          # expense-dev-sg
#   description = "Allow all outbound traffic"
#   vpc_id      = var.vpc_id

#   tags = {
#     Name = "${var.project_name}-${var.environment}-sg"
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
# }



resource "aws_security_group" "main" {
  name        = "${var.project_name}-${var.environment}-${var.sg_name}-sg"
  description = "create security group"
  vpc_id      = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = "${var.project_name}-${var.environment}-${var.sg_name}-sg"
  }


}



 