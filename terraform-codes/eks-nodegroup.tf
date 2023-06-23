resource "aws_eks_node_group" "houstagram-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.houstagram-eks-cluster.name
  node_group_name = "houstagram-eks-nodegroup"
  node_role_arn   = aws_iam_role.houstagram-iam-role-eks-nodegroup.arn
  subnet_ids      = [aws_subnet.houstagram-private-subnet3.id, aws_subnet.houstagram-private-subnet4.id,
                     aws_subnet.houstagram-private-subnet5.id, aws_subnet.houstagram-private-subnet6.id]
  instance_types = ["t3a.medium"]
  disk_size = 20

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.houstagram-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.houstagram-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.houstagram-iam-policy-eks-nodegroup-ecr,
  ]

  tags = {
    "Name" = "${aws_eks_cluster.houstagram-eks-cluster.name}-worker-node"
  }
}