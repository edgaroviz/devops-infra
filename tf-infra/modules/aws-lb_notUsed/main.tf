resource "helm_release" "aws_lb_controller" {
  name       = "${var.environment}-${var.region}-aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  set {
    name  = "clusterName"
    value = var.eks_cluster_name
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }
}

resource "kubernetes_ingress_v1" "counter_service_ingress" {
  depends_on = [ helm_release.aws_lb_controller ]
  metadata {
    name      = "counter-service-ingress"
    namespace = "counter-service"
    annotations = {
      "kubernetes.io/ingress.class"                      = "alb"
      "alb.ingress.kubernetes.io/scheme"                = "internet-facing"
      "alb.ingress.kubernetes.io/target-type"           = "ip"
      "alb.ingress.kubernetes.io/listen-ports"          = "[{\"HTTP\": 80}]"
      "alb.ingress.kubernetes.io/group.name"            = "counter-service-alb"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "counter-service-${var.environment}"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}