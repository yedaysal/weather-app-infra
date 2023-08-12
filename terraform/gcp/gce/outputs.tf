output "gce_instance_public_ip" {
  description = "IP address of the created weather app GCE instance"
  value = google_compute_instance.weather_app.network_interface.0.access_config.0.nat_ip
}