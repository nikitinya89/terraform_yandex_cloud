output "ubuntu_image_id" {
  description = "Latest Ubuntu 24.04 image ID"
  value       = data.yandex_compute_image.ubuntu_latest.image_id
}

output "public_ip" {
    description = "Public IP address of the instance"
    value = yandex_compute_instance.instance.network_interface[0].nat_ip_address 
}
