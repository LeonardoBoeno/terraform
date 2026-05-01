// Basic option to avoid repetition and centralize changes, making it easier for future management
locals {
  service_name = "foo"
  owner        = "bar"
  environment  = "production"
}

resource "aws_instance" "basic-exemple" {
  ami           = "ami-12345678"
  instance_type = "t3.micro"

  tags = {
    Name        = local.service_name
    Owner       = local.owner
    Environment = local.environment
  }
}

// You can combine instance ids from two different resource lists with the concat function, to create a single list as needed.
// possible trade off, it keeps duplicated entries
locals {
  instance_ids = concat(aws_instance.blue[*].id, aws_instance.green[*].id)

  common_tags = {
    Service     = local.service_name
    Owner       = local.owner
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

// you can also use multiple locals to organize related values, based on your project needs.
locals {
  # Network configuration
  vpc_cidr = "10.0.0.0/16"
  az_count = length(data.aws_availability_zones.available.names)
}

locals {
  # Application configuration
  app_name = "${var.project_name}-${var.environment}"
  app_port = 8080
}

locals {
  # Computed values
  subnet_cidrs = [
    for i in range(local.az_count) :
    cidrsubnet(local.vpc_cidr, 8, i)
  ]
}


