provider "google" {
  credentials = "${file("gcp-terraform-sa-key.json")}"
  project = var.project_id
  region  = var.region
}