# create namespaces
resource "kubernetes_namespace" "namespaces" {
  for_each = toset(local.namespaces)
  metadata {
    labels = {
      managed_by = "terraform"
    }

    name = each.key
  }
}

resource "kubernetes_namespace" "developers_namespaces" {
  for_each = toset(local.developers)
  metadata {
    labels = {
      managed_by = "terraform"
    }

    name = each.key
  }
}
