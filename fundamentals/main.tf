resource "aws_s3_bucket" "this" {
  bucket = "my-tf-fundamentals-bucket"

  tags = {
    Name        = "my-tf-fundamentals-bucket"
    Environment = "Mentorship"
  }
}