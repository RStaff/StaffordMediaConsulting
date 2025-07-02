/*
  outputs from the financial_pipeline module
*/
output "tfstate_bucket_arn" {
  description = "The ARN of the S3 bucket holding state"
  value       = aws_s3_bucket.tfstate.arn
}

output "lock_table_name" {
  description = "The DynamoDB table name used for state locking"
  value       = aws_dynamodb_table.lock.name
}
