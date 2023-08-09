output "devops-server_public_ip" {
  description = "IP address of the created devops-server GCE instance"
  value = google_compute_instance.devops-server.network_interface.0.access_config.0.nat_ip
}