#!/usr/bin/env bash
set -euo pipefail

# 1) Fix module source path in each env stub
for env in dev staging prod; do
  sed -i '' \
    -e 's|source *= *"../../../../infra/modules/financial_pipeline"|source = "../../../infra/modules/financial_pipeline"|' \
    "$env/infra/financial_pipeline/main.tf"
done

# 2) Turn hard-coded backend settings into vars
for env in dev staging prod; do
  sed -i '' \
    -e 's|bucket *= *".*"|bucket         = var.bucket_name|' \
    -e 's|region *= *".*"|region         = var.region|' \
    -e 's|dynamodb_table *= *".*"|dynamodb_table = var.dynamodb_table|' \
    "$env/infra/financial_pipeline/main.tf"
done

# 3) Add variables.tf to each env stub
for env in dev staging prod; do
  cat > "$env/infra/financial_pipeline/variables.tf" <<VARS
variable "bucket_name" {
  default = "ross-data-pipeline-tfstate"
}
variable "region" {
  default = "us-east-1"
}
variable "dynamodb_table" {
  default = "ross-data-pipeline-tfstate-locks"
}
VARS
done

# 4) Stage, commit, push
git add dev/infra/financial_pipeline staging/infra/financial_pipeline prod/infra/financial_pipeline
git commit -m "fix: standardize per-env financial_pipeline stubs"
git push
