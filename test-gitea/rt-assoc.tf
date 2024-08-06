resource "aws_route_table_association" "rt-tbl-assoc" {
  subnet_id      = aws_subnet.subnet-a.id
  route_table_id = aws_route_table.new_rt.id
}