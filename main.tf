resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = "demo-namespace"
  }
}

resource "kubernetes_manifest" "app_deployment" {
  manifest = yamldecode(templatefile("${path.module}/manifests/deployment.yaml", {
    app_name  = var.app_name,
    app_image = var.app_image,
    app_port  = var.app_port,
    replicas  = var.replicas
  }))
  depends_on = [kubernetes_namespace.app_namespace]
}

resource "kubernetes_service" "app_service" {
  metadata {
    name      = "${var.app_name}-service"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
  }

  spec {
    selector = {
      app = var.app_name
    }

    port {
      port        = var.app_port
      target_port = var.app_port
    }

    type = "LoadBalancer"
  }
  depends_on = [kubernetes_namespace.app_namespace]
}
