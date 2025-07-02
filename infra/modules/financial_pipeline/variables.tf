/*
  inputs for the financial_pipeline module
*/
variable "bucket_name" {
  description = "S3 bucket for storing Terraform state"
  type        = string
}

variable "key" {
  description = "Path inside the bucket to store the state file"
  type        = string
}

variable "region" {
  description = "AWS region for backend resources"
  type        = string
  default     = "us-east-1"
}

variable "dynamodb_table" {
  description = "DynamoDB table name for state locking"
  type        = string
}
