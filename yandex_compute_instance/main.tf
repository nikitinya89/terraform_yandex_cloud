data "yandex_compute_image" "ubuntu_latest" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_disk" "disk" {
  name     = "${var.prefix}-${var.vm_name}-disk"
  image_id = data.yandex_compute_image.ubuntu_latest.image_id
  zone     = var.zone
  size     = var.disk_size
  type     = var.disk_type
}

resource "yandex_compute_instance" "instance" {
  name        = "${var.prefix}-${var.vm_name}"
  hostname    = "${var.prefix}-${var.vm_name}"
  zone        = var.zone
  platform_id = var.platform_id

  resources {
    cores  = var.cores
    memory = var.memory
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.nat_address
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk.id
  }

  metadata = {
    user-data = templatefile("${path.module}/files/cloud-init.yml", {
      user_name  = var.user_name
      public_key = var.public_key
      }
    )
  }
}





