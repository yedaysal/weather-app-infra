data "aws_subnet" "weather_app" {
  tags = {
    "Name" = "weather-app-subnet"
  }
}

data "aws_security_group" "weather_app" {
  tags = {
    "Name" = "weather-app-security-group"
  }
}