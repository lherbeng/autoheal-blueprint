# Define your AWS provider configuration
provider "aws" {
  region = "us-west-2" # Choose your preferred AWS region
}

# Define an Auto Scaling Group (ASG) for your instances
resource "aws_launch_configuration" "example_lc" {
  name_prefix          = "example-lc-"
  image_id             = "ami-12345678" # Replace with your desired AMI ID
  instance_type        = "t2.micro"     # Replace with your desired instance type
  security_groups      = ["sg-12345678"] # Replace with your security group ID
  key_name             = "your-key-pair"
}

resource "aws_autoscaling_group" "example_asg" {
  name                  = "example-asg"
  launch_configuration = aws_launch_configuration.example_lc.name
  min_size              = 2  # Minimum instances
  max_size              = 4  # Maximum instances
  desired_capacity      = 2  # Initial number of instances
  vpc_zone_identifier   = ["subnet-12345678"] # Replace with your subnet ID

  # Autoscaling policies based on CPU utilization
  metric_trigger {
    metric_name = "CPUUtilization"
    statistic   = "Average"
    unit        = "Percent"
    threshold   = 75 # Adjust this threshold as needed
    period      = 60 # Adjust this period as needed
    evaluation_periods = 2
    scale_in_cooldown  = 300 # Time to wait before scaling in (seconds)
    scale_out_cooldown = 300 # Time to wait before scaling out (seconds)
    adjustment_type    = "ChangeInCapacity"
    scaling_adjustment = 1  # Scale out by 1 instance
  }
}

# Create a security group allowing inbound HTTP traffic
resource "aws_security_group" "example_sg" {
  name        = "example-sg"
  description = "Allow inbound HTTP traffic"
  vpc_id      = "vpc-12345678" # Replace with your VPC ID

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define Prometheus and Grafana setup (simplified)
# You may use more elaborate configurations in production
# This example sets up Prometheus and Grafana containers on the instances

# ...

# Output the public IPs of instances
output "instance_public_ips" {
  value = aws_instance.example_instances[*].public_ip
}
