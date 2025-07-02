output "bucket" {
  value       = aws_s3_bucket.tfstate.bucket
  description = "Name of the TF state bucket"
}

output "table_name" {
  value       = aws_dynamodb_table.lock.name
  description = "Name of the TF lock table"
}
