resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name    = "longe-cluster"
  region  = "eu-west-2"
  version = "1.23"

  node_pool {
    name       = "db-pool"
    size       = "s-2vcpu-4gb"
    auto_scale = true
    node_count = 1
    min_nodes  = 1
    max_nodes  = 5
    tags       = ["db-nodes"]
  }
}
