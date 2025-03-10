resource "helm_release" "argocd" {
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.4.5"
  create_namespace = true
  name      = "argocd"
  namespace = "argocd"

  values = [
    file("${path.module}/values.yaml")
  ]
}