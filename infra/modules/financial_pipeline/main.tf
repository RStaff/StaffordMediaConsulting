
module "financial_pipeline" {
  source         = "../../../infra/modules/financial_pipeline"
  bucket_name    = "ross-data-pipeline-tfstate"
  key            = "${env}/financial_pipeline/terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = "ross-data-pipeline-tfstate-locks"
}
