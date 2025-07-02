variable "bucket_name" {
  type        = string
  description = "S3 bucket for Terraform state"
  default     = "ross-data-pipeline-tfstate"
}

variable "dynamodb_table" {
  type        = string
  description = "DynamoDB table for Terraform locks"
  default     = "ross-data-pipeline-tfstate-locks"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "key" {
  type        = string
  description = "State file key (path) in the S3 bucket"
}
