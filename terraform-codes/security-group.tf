########### EKS Security Group ###########

resource "aws_security_group" "houstagram-sg-eks-cluster" {
  name        = "houstagram-sg-eks-cluster"
  description = "security_group for houstagram-eks-cluster"
  vpc_id      = aws_vpc.houstagram-vpc.id

  tags = {
    Name = "houstagram-sg-eks-cluster"
  }
}

resource "aws_security_group_rule" "houstagram-sg-eks-cluster-ingress" {

  security_group_id = aws_security_group.houstagram-sg-eks-cluster.id
  type              = "ingress"
  description       = "ingress security_group_rule for houstagram-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "houstagram-sg-eks-cluster-egress" {

  security_group_id = aws_security_group.houstagram-sg-eks-cluster.id
  type              = "egress"
  description       = "egress security_group_rule for houstagram-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

########### Bastion (EC2 Instance) Security Group ###########

resource "aws_security_group" "houstagram-sg-bastion" {

  name   = "houstagram-sg-bastion"
  vpc_id = aws_vpc.houstagram-vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for bastion"
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "egress security_group_rule for bastion"
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  tags = {
    Name = "houstagram-sg-bastion"
  }
}
