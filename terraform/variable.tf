variable "project" {
  type    = string
  default = "sample" # FIXME or create terraform.tfvars file
}

variable "region" {
  type    = string
  default = "asia-northeast2"
}

variable "zone" {
  type    = string
  default = "asia-northeast1-b"
}

variable "machine_type" {
  type    = string
  default = "e2-standard-4"
}

variable "network_tags" {
  type    = list(string)
  default = ["palworld"]
}
