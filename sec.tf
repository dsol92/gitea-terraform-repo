resource "aws_security_group" "new_sg_inst" {
  name        = "new_sg_inst"
  vpc_id      = aws_vpc.new_env.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_subnet.subnet-a.cidr_block, aws_subnet.subnet-b.cidr_block]
  }
  
  ingress {
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = [aws_subnet.subnet-a.cidr_block, aws_subnet.subnet-b.cidr_block]
  }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "new_sg_inst"
  }
}

resource "aws_security_group" "new_sg_alb" {
  name        = "new_sg_alb"
  vpc_id      = aws_vpc.new_env.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "new_sg_alb"
  }
}