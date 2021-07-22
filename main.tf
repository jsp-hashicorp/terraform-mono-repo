module "nginx-nomad" {
  source = "./prod"

  http_port = var.http_port
  service_name = var.service_name
  service_tag = var.service_tag
}
