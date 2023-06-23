resource "aws_s3_bucket" "houstagram" {

  bucket = "houstagram"

  tags = {
    "Name" = "houstagram"
  }
}

resource "aws_dynamodb_table" "houstagram-tf-lock" {

  depends_on   = [aws_s3_bucket.houstagram]
  name         = "houstagram-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "houstagram-tf-lock"
  }

}