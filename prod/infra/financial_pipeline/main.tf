terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = "prod/financial_pipeline/terraform.tfstate"
    region         = var.region
    dynamodb_table = var.dynamodb_table
  }
}

module "financial_pipeline" {
  source         = "../../../infra/modules/financial_pipeline"
  bucket_name    = var.bucket_name
  key            = "prod/financial_pipeline/terraform.tfstate"
  region         = var.region
  dynamodb_table = var.dynamodb_table
}
