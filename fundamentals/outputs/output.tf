// export information about your resource modules 

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "instance_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.web.private_ip
}

// access exported information 

module "web_server" {
  source = "./modules/web_server"
  # …
}

resource "aws_route53_record" "web" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "web.example.com"
  type    = "A"
  records = [module.web_server.instance_ip]
  #...
}

resource "aws_cloudwatch_alarm" "web_health" {
  alarm_name          = "web-server-health"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "80"

  dimensions = {
    InstanceId = module.web_server.instance_id
  }
  # ...
}