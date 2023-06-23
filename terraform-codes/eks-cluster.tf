resource "aws_eks_cluster" "houstagram-eks-cluster-web" {

  depends_on = [
    aws_iam_role_policy_attachment.houstagram-iam-policy-eks-cluster,
    aws_iam_role_policy_attachment.houstagram-iam-policy-eks-cluster-vpc,
  ]

  name     = var.cluster-name
  role_arn = aws_iam_role.houstagram-iam-role-eks-cluster.arn
  version = "1.26"

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    security_group_ids = [aws_security_group.houstagram-sg-eks-cluster.id]
    subnet_ids         = [aws_subnet.houstagram-private-subnet3.id, aws_subnet.houstagram-private-subnet4.id,
                          aws_subnet.houstagram-private-subnet5.id, aws_subnet.houstagram-private-subnet6.id]
    endpoint_public_access = false
    endpoint_private_access = true
  }
}