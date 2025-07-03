resource "aws_s3_bucket" "tfstate" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "aws_dynamodb_table" "lock" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

