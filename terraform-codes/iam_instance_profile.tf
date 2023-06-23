resource "aws_iam_instance_profile" "houstagram-ec2-instance-profile" {
  name = "houstagram-ec2-instance-profile"
  path = "/"
  role = "houstagram-iam-role-ec2-instance-bastion"
}
