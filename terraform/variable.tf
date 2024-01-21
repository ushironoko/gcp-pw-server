variable "project" {
  type    = string
  default = "ushironoko-pw" # FIXME or create terraform.tfvars file
}

variable "region" {
  type    = string
  default = "asia-northeast2"
}

variable "zone" {
  type    = string
  default = "asia-northeast2-a"
}

variable "machine_type" {
  type    = string
  default = "n1-highmem-2"
}

variable "network_tags" {
  type    = list(string)
  default = ["palworld"]
}
