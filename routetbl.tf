resource "aws_route_table" "new_rt" {
  vpc_id = aws_vpc.new_env.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new_env_gw.id
  }

  tags = {
    Name = "my_routetable"
  }
}