
########## Public Subnet Route Tables ########## 

resource "aws_route_table" "houstagram-route-table-pub-sub" {

  depends_on = [
    aws_vpc.houstagram-vpc,
    aws_internet_gateway.houstagram-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.houstagram-internet-gateway.id
  }

  tags = {
    Name = "houstagram-route-table-pub-sub"
  }

  tags_all = {
    Name = "houstagram-route-table-pub-sub"
  }

  vpc_id = aws_vpc.houstagram-vpc.id
}



########## Private Subnet Route Tables ########## 

resource "aws_route_table" "houstagram-route-table-pri-sub" {

  depends_on = [
    aws_vpc.houstagram-vpc,
    aws_nat_gateway.houstagram-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.houstagram-nat-gateway.id
  }

  tags = {
    Name = "houstagram-route-table-pri-sub"
  }

  tags_all = {
    Name = "houstagram-route-table-pri-sub"
  }

  vpc_id = aws_vpc.houstagram-vpc.id
}
