provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "ross-data-pipeline-tfstate"
//  acl    = "private"
}

resource "aws_dynamodb_table" "lock" {
  name         = "ross-data-pipeline-tfstate-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
