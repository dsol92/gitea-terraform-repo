resource "aws_internet_gateway" "new_env_gw" {
vpc_id = aws_vpc.new_env.id
}