resource "helm_release" "gitlab_runner" {
  name       = "gitlab-runner"
  repository = "http://charts.gitlab.io/"
  chart      = "gitlab-runner"
  version    = "0.43.1"
  namespace  = "gitlab-runenr"

  verify = true
  lint   = true

  values = [
    "${file("helm-valuesFile/values.infra.yaml")}"
  ]

  depends_on = [
    module.eks,
  ]
}