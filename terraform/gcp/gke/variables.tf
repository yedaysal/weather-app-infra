variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "project_id" {
  type    = string
  default = "weather-app-project-395522"
}

variable "region" {
  type    = string
  default = "europe-central2"
}