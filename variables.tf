variable "AWS_REGION" {
  description = "ap-northeast-2"
}

variable "availability_zones" {
  description = "List of availability zones to use for the subnets"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks for VPC"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks for VPC"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}