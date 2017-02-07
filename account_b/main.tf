provider "aws" {
  access_key = ""
  secret_key = ""
  region     = ""
}

module "lambda_iam_account" {
  source     = "../modules/lambda_iam"
  account_id = ""
}
