variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "project_id" {
  type    = string
  default = "CHANGEME"
}

variable "region" {
  type    = string
  default = "europe-central2"
}