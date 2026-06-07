terraform {
  backend "s3" {
    bucket = "bedrock-tf-state-maryame"
    key    = "project-bedrock/terraform.tfstate"
    region = "us-east-1"
  }
}