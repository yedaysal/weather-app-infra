provider "google" {
  credentials = "${file(var.credentials_filename)}"
  project     = var.project_id
  region      = var.region
}