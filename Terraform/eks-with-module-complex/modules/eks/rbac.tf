/* resource "kubernetes_role" "developers_role" {
  for_each = toset(var.config.developers)
  metadata {
    name      = "${each.key}-role"
    namespace = each.key
    labels = {
      managed_by = "terraform"
    }
  }

  rule {
    api_groups = ["*"]
    resources  = ["*"]
    verbs      = ["*"]
  }
  depends_on = [
    kubernetes_namespace.developers_namespaces
  ]
}

resource "kubernetes_role_binding" "developers" {
  for_each = toset(var.config.developers)
  metadata {
    name      = "${each.key}-role-binding"
    namespace = each.key
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "${each.key}-role"
  }
  subject {
    kind      = "Group"
    name      = "developers:${each.key}"
    api_group = "rbac.authorization.k8s.io"
  }
  depends_on = [
    kubernetes_namespace.developers_namespaces
  ]
} */
