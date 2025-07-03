resource "aws_s3_bucket" "tfstate" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "aws_dynamodb_table" "lock" {
  name         = var.dynamodb_table
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}
