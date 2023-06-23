resource "aws_internet_gateway" "houstagram-internet-gateway" {

  depends_on = [
    aws_vpc.houstagram-vpc
  ]

  vpc_id = aws_vpc.houstagram-vpc.id

  tags = {
     Name = "houstagram-internet-gateway-name"
  }

  tags_all = {
    Name  = "houstagram-internet-gateway-name"
  }
}

