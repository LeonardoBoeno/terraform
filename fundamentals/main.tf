resource "aws_s3_bucket" "this" {
  bucket = "my-tf-state-bucket"

  tags = {
    Name        = "my-tf-state-bucket"
    Environment = "Mentorship"
  }
}