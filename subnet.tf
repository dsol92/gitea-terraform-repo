resource "aws_subnet" "subnet-a" {
  cidr_block        = cidrsubnet(aws_vpc.new_env.cidr_block, 3, 1)
  vpc_id            = aws_vpc.new_env.id
  availability_zone = "ap-southeast-1a"
}

resource "aws_subnet" "subnet-b" {
  cidr_block        = cidrsubnet(aws_vpc.new_env.cidr_block, 4, 1)
  vpc_id            = aws_vpc.new_env.id
  availability_zone = "ap-southeast-1b"
}