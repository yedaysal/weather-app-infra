# Create a VPC for weather-app VMs
resource "aws_vpc" "weather_app" {
  cidr_block = "172.16.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "weather-app-vpc"
  }
}

# Create a subnet in the 'weather-app-vpc' vpc
resource "aws_subnet" "weather_app" {
  vpc_id = aws_vpc.weather_app.id
  cidr_block = "172.16.10.0/24"
  availability_zone = var.region_a
    
  tags = {
    Name = "weather-app-subnet"
  }
}

# Create an internet gateway in the 'weather-app-vpc' vpc
resource "aws_internet_gateway" "weather_app" {
  vpc_id = aws_vpc.weather_app.id

  tags = {
    Name = "weather-app-vpc-internet-gw"
  }
}

# Add 0.0.0.0/0 to the 'rhce' vpc's default route table
resource "aws_default_route_table" "weather_app" {
  default_route_table_id = aws_vpc.weather_app.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.weather_app.id
  }

  tags = {
    Name = "weather-app-vpc-route-table"
  }
}

# Add following rules to the 'rhce' vpc's default security group (firewall)
resource "aws_default_security_group" "weather_app" {
  vpc_id = aws_vpc.weather_app.id

  ingress {
    protocol = -1
    self = true
    from_port = 0
    to_port = 0
  }

  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "NPM"
    from_port = 81
    to_port = 81
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "JENKINS"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "NEXUS-1"
    from_port = 8081
    to_port = 8081
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "NEXUS-2"
    from_port = 8082
    to_port = 8082
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "weather-app-security-group"
  }
}