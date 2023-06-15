variable "aws_region" {
  default = "ap-northeast-2"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "cluster_name" {
  default = "eks-demo"
}

variable "instance_type" {
  default = "m5.large"
}

variable "desired_capacity" {
  default = 3
}

variable "volume_size" {
  default = 20
}
