output "weather_app_instance_public_ip" {
  description = "Public IP address of the create weather-app instance"
  value = aws_eip.weather_app.public_ip
}

output "weather_app_instance_public_dns" {
  description = "Public DNS name of the create weather-app instance"
  value = aws_eip.weather_app.public_dns
}
