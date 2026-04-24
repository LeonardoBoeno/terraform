resource "aws_s3_bucket" "this" {
  bucket = "my-tf-state-bucket" // or var.bucket_name

  tags = {
    Name        = "my-tf-state-bucket" // or var.bucket_name
    Environment = "Mentorship"
  }
}