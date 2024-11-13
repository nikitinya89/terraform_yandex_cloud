variable "prefix" {
  description = "Project name prefix"
  type        = string
}

variable "zone" {
  description = "Yandex Cloud zone"
  type        = string
}

variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "disk_size" {
  description = "VM disk size"
  type        = number
}

variable "disk_type" {
  description = "Disk type"
  type        = string
  validation {
    condition     = contains(["network-ssd", "network-hdd", "network-ssd-nonreplicated", "network-ssd-io-m3", ], var.disk_type)
    error_message = "Disk type must be one of these: network-ssd, network-hdd, network-ssd-nonreplicated, network-ssd-io-m3."
  }
  default = "network-ssd"
}

variable "platform_id" {
  description = "Instance platform type"
  type        = string
  validation {
    condition     = contains(["standard-v1", "standard-v2", "standard-v3", "highfreq-v3", "gpu-standard-v1", "gpu-standard-v2", "gpu-standard-v3", "gpu-standard-v3-t4"], var.platform_id)
    error_message = <<EOT
PLatform id must be one of these:
    standard-v1 - Intel Broadwell
    standard-v2 - Intel Cascade Lake
    standard-v3 - Intel Ice Lake
    highfreq-v3 - Intel Ice Lake Compute-Optimized
    gpu-standard-v1 - Intel Broadwell with NVIDIA Tesla V100
    gpu-standard-v2 - Intel Cascade Lake with NVIDIA Tesla V100
    gpu-standard-v3 - AMD EPYC with NVIDIA Ampere A100
    gpu-standard-v4-t4 - Intel Ice Lake with NVIDIA Tesla T4
EOT
  }
  default = "standard-v1"
}

variable "cores" {
  description = "Number of CPU cores for the instance"
  type        = number
}

variable "memory" {
  description = "Number of memory for the instance"
  type        = number
}

variable "subnet_id" {
  description = "Subnet ID for network interface"
  type        = string
}

variable "nat_address" {
  description = "Public IP"
  type        = bool
  default     = false
}

variable "user_name" {
  description = "User that will be created by cloud-init"
  type        = string
}

variable "public_key" {
  description = "SSH public key for user"
}
