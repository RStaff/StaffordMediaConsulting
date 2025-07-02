terraform {
  backend "s3" {
    bucket         = "ross-data-pipeline-tfstate"
    key            = "staging/financial_pipeline/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ross-data-pipeline-tfstate-locks"
  }
}

module "financial_pipeline" {
  source         = "../../../infra/modules/financial_pipeline"
  bucket_name    = "ross-data-pipeline-tfstate"
  key            = "staging/financial_pipeline/terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = "ross-data-pipeline-tfstate-locks"
}
