variable "instance_type" {
  type        = string
  description = "EC2 instance type for the web server"
  default     = "t2.micro"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where the web server will be deployed"
}

variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "database_password" {
  type        = string
  description = "Password for the RDS database instance"
  sensitive   = true
}