variable "credentials_filename" {
  type    = string
  default = "gcp_terraform_credentials.json"
}

variable "hostname" {
  type    = string
  default = "devops-server.example.com"
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
  default = "numeric-citron-395305"
}

variable "region" {
  type    = string
  default = "europe-central2"
}

variable "ssh_pub_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxagIioLVcxCMi1i0CXWz4RdoSb0ZbMNI8oVM/yfXoh9QnXgX8TfZc1C7rAdb0Vzj1nET29xHpmur4ppJtQlXV2L2VFZI1Hq5GdQT50UQ/tVHQ7ML6efxnMS4WCcduZarVKqi4z8v9RCJwW40CstMYmpEOjughT9npDHsfvA5t1QSCSkkUr7ZAOFsOGKjFXPaXICBvB66c41hA2KiJ0prkH8gwK/fvV8IufTTxkUg7erFB99M51e0DW0pSs7icv8xT1v+hy7w6u7zr2fjQ+FyXyxQMCUck4gCEhkWHvuCgPOt6eQSO74vIWKlfWaxYkhZi9Y+nJ3rErcAzshWH4+tL26X2VF+9D6IiIS6G3dr0rhenDAPW3T1WbpPBigD/mq8KQgZIIq6DrJPqoMNYo592ZrUmfQncv+zCQ3wU07jc/rkTtuob293vZEo2KqKBS8ZLscCTUz0gDNFR5sZ4hn0zxpjiPZwlrxWmtQASTzJbcwOHPoqD8i3cBm3OiVHzhAE= edaysal@192.168.1.64"
}

variable "zone" {
  type    = string
  default = "europe-central2-a"
}
