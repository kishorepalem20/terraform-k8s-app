output "app_name" {
  value = var.app_name
}

output "namespace" {
  value = kubernetes_namespace.app_namespace.metadata[0].name
}

output "service_url" {
  value = "http://${kubernetes_service.app_service.status[0].load_balancer[0].ingress[0].ip}:${var.app_port}"
}

