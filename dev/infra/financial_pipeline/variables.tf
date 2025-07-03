variable "bucket_name" {
  default = "ross-data-pipeline-tfstate"
}

variable "region" {
  default = "us-east-1"
}

variable "dynamodb_table" {
  default = "ross-data-pipeline-tfstate-locks"
}
