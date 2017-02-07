provider "aws" {
  access_key = ""
  secret_key = ""
  region     = ""
}

module "lambda_iam_account" {
  source     = "../modules/lambda_iam"
  account_id = ""
}

module "build_agent" {
  source       = "../modules/build_agent_iam"
  account_a_id = ""
  account_b_id = ""
}
