resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  depends_on = [ kubernetes_namespace.argocd ]
  name             = "argocd"
  namespace        = "argocd"
  # create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"

  values = [
    <<EOF
server:
  service:
    type: LoadBalancer
EOF
  ]
}

resource "kubernetes_manifest" "counter-service" {
  manifest = yamldecode(file("${path.module}/../../../../../argocd-applications/counter-service/counter-service.yaml"))
}