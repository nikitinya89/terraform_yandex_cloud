resource "yandex_vpc_network" "vpc_network" {
  name = var.vpc_network
}

resource "yandex_vpc_subnet" "vpc_subnet" {
  name           = var.vpc_subnet
  zone           = var.zone
  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = var.v4_cidr_blocks
}

resource "yandex_vpc_gateway" "vpc_gateway" {
  name = var.vpc_gateway
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "route_table" {
  name = var.vpc_route_table_name
  network_id = yandex_vpc_network.vpc_network.id
  static_route {
    gateway_id = yandex_vpc_gateway.vpc_gateway.id
  }
}
