############ Public Subnets ############

resource "aws_subnet" "houstagram-public-subnet1" {

  depends_on = [
    aws_vpc.houstagram-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.10.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "houstagram-public-subnet1"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  tags_all = {
    Name                                     = "houstagram-public-subnet1"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  vpc_id = aws_vpc.houstagram-vpc.id
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "houstagram-public-subnet2" {

  depends_on = [
    aws_vpc.houstagram-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.20.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "houstagram-public-subnet2"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  tags_all = {
    Name                                     = "houstagram-public-subnet2"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  vpc_id = aws_vpc.houstagram-vpc.id
  availability_zone = "ap-northeast-2c"
}

############ Private Subnets ############

resource "aws_subnet" "houstagram-private-subnet3" {

  depends_on = [
    aws_vpc.houstagram-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.30.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "houstagram-private-subnet3"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "houstagram-private-subnet3"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.houstagram-vpc.id
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "houstagram-private-subnet4" {

  depends_on = [
    aws_vpc.houstagram-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.40.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "houstagram-private-subnet4"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "houstagram-private-subnet4"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.houstagram-vpc.id
  availability_zone = "ap-northeast-2c"
}

resource "aws_subnet" "houstagram-private-subnet5" {

  depends_on = [
    aws_vpc.houstagram-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.50.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "houstagram-private-subnet5"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "houstagram-private-subnet5"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.houstagram-vpc.id
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "houstagram-private-subnet6" {

  depends_on = [
    aws_vpc.houstagram-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.60.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "houstagram-private-subnet6"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "houstagram-private-subnet6"
    "kubernetes.io/cluster/houstagram-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.houstagram-vpc.id
  availability_zone = "ap-northeast-2c"
}
