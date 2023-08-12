variable "credentials_filename" {
  type    = string
  default = "gcp-terraform-sa-key.json"
}

variable "hostname" {
  type    = string
  default = "weather-app.example.com"
}

variable "image" {
  type    = string
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "machine_type" {
  type    = string
  default = "e2-highcpu-4"
}

variable "project_id" {
  type    = string
  default = "CHANGEME"
}

variable "region" {
  type    = string
  default = "europe-central2"
}

variable "ssh_pub_key" {
  type = string
  default = "CHANGEME"
}

variable "zone" {
  type    = string
  default = "europe-central2-a"
}
