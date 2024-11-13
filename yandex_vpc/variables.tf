
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
  type = list(string)
  default = [ "10.10.0.0/16" ]
}

###


variable "nat" {
  type    = bool
  default = true
}

variable "image_family" {
  type    = string
  default = "windows-2019-dc-gvlk"
}

variable "name" {
  type = string
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 4
}

variable "disk_size" {
  type    = number
  default = 50
}

variable "disk_type" {
  type    = string
  default = "network-nvme"
}

variable "user_name" {
  default = ""
  type    = string
}

variable "user_pass" {
  default = ""
  type    = string
}

variable "admin_pass" {
  default = ""
  type    = string
}

variable "timeout_create" {
  default = "10m"
}

variable "timeout_delete" {
  default = "10m"
}
