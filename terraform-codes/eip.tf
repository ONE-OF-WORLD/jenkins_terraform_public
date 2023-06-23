resource "aws_eip" "houstagram-elastic-ip" {
  network_border_group = "ap-northeast-2"
  public_ipv4_pool     = "amazon"

  tags = {
    Name        = "houstagram-elastic-ip"
  }

  tags_all = {
    Name        = "houstagram-elastic-ip"
  }

  vpc = true
}
