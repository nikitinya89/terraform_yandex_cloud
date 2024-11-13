
variable "vpc_network" {
  description = "VPC network name"
  type        = string
  default     = "ya-network"
}

variable "vpc_subnet" {
  description = "VPC subnet name"
  type        = string
  default     = "ya-subnet"
}

variable "zone" {
  description = "Yandex cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "v4_cidr_blocks" {
  description = "VPC subnet cidr"
  type = list(string)
  default = [ "10.10.0.0/16" ]
}

variable "vpc_gateway" {
  description = "VPC gateway name"
  type = string
  default = "ya-gateway"
}