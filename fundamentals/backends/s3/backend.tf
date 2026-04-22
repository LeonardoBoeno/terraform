terraform {
  backend "s3" {
    bucket = "my-tf-state-bucket"
    key    = "states/poc-backend"
    region = "us-east-1"
  }
}