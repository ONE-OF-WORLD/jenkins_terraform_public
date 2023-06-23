resource "aws_nat_gateway" "houstagram-nat-gateway" {

  depends_on = [
    aws_eip.houstagram-elastic-ip
  ]

  allocation_id     = aws_eip.houstagram-elastic-ip.id
  subnet_id         = aws_subnet.houstagram-public-subnet2.id
  connectivity_type = "public"

  tags = {
    Name        = "houstagram-nat-gateway"
  }

  tags_all = {
    Name        = "houstagram-nat-gateway"
  }

}
