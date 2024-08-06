resource "aws_instance" "test_env_ec2" {
  ami                         = "ami-060e277c0d4cce553"
  instance_type               = "t2.micro"
  key_name                    = "user_key"
  security_groups             = ["${aws_security_group.new_sg_inst.id}"]
  associate_public_ip_address = true

  subnet_id = aws_subnet.subnet-a.id
  user_data = "${file("script.sh")}"
			  
			  
  tags = {
    Name = join("-", ["new_inst", var.ctr])
  }
}