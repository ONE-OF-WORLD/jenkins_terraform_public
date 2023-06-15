provider "aws" {
  region = var.aws_region
}

locals {
  cluster_tags = {
    Terraform = "true"
    KubernetesCluster = var.cluster_name
  }
}

resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = local.cluster_tags
}

resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  description = "eks_worker_group_mgmt_one"
  vpc_id = aws_vpc.this.id

  tags = local.cluster_tags
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.cluster_name
  cidr = var.cidr_block

  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = false
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name = var.cluster_name
  subnets = module.vpc.private_subnets

  tags = local.cluster_tags
  vpc_id = aws_vpc.this.id

  enable_irsa = true

  eks_oidc_provider_iam_role_name = "eksctl-${var.cluster_name}-addons-oidc"
  eks_oidc_provider_iam_role_arn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/eksctl-${var.cluster_name}-addons-oidc"

  vpc_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]

  write_kubeconfig = false

  node_groups_defaults = {
    ami_type = "AL2_x86_64"
  }

  node_groups = {
    node-group = {
      additional_tags = {
        Terraform   = "true"
        KubernetesCluster = var.cluster_name
      }

      additional_userdata = <<-USERDATA
        set -ex
        yum install -y aws-cfn-bootstrap
      USERDATA

      desired_capacity = var.desired_capacity
      disk_size        = var.volume_size
      instance_type    = var.instance_type
      k8s_labels       = {
        Terraform   = "true"
        KubernetesCluster = var.cluster_name
      }
    }
  }
}
