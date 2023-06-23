
########## Public Subnet Route Tables Association ########## 

resource "aws_route_table_association" "houstagram-route-association-pub-sub1" {
  route_table_id = aws_route_table.houstagram-route-table-pub-sub.id
  subnet_id      = aws_subnet.houstagram-public-subnet1.id
}

resource "aws_route_table_association" "houstagram-route-association-pub-sub2" {
  route_table_id = aws_route_table.houstagram-route-table-pub-sub.id
  subnet_id      = aws_subnet.houstagram-public-subnet2.id
}

# resource "aws_route_table_association" "houstagram-route-association-pub-sub2" {
#   route_table_id = aws_route_table.houstagram-route-table-pub-sub2.id
#   subnet_id      = aws_subnet.houstagram-private-subnet4.id
# }

########## Private Subnet Route Tables Association ########## 

resource "aws_route_table_association" "houstagram-route-association-pri-sub3" {
  route_table_id = aws_route_table.houstagram-route-table-pri-sub.id
  subnet_id      = aws_subnet.houstagram-private-subnet3.id
}

resource "aws_route_table_association" "houstagram-route-association-pri-sub4" {
  route_table_id = aws_route_table.houstagram-route-table-pri-sub.id
  subnet_id      = aws_subnet.houstagram-private-subnet4.id
}

resource "aws_route_table_association" "houstagram-route-association-pri-sub5" {
  route_table_id = aws_route_table.houstagram-route-table-pri-sub.id
  subnet_id      = aws_subnet.houstagram-private-subnet5.id
}

resource "aws_route_table_association" "houstagram-route-association-pri-sub6" {
  route_table_id = aws_route_table.houstagram-route-table-pri-sub.id
  subnet_id      = aws_subnet.houstagram-private-subnet6.id
}

