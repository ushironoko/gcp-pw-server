variable "project" {
  type    = string
  default = "sample" # FIXME or create terraform.tfvars file
}

variable "region" {
  type    = string
  default = "asia-northeast1"
}

variable "zone" {
  type    = string
  default = "asia-northeast1-a"
}

variable "machine_type" {
  type    = string
  default = "n1-standard-1"
}

variable "network_tags" {
  type    = list(string)
  default = ["minecraft"]
}
