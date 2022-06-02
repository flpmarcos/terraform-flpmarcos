# Algumas variáveis extras
variable "gke_username" {
  default     = ""
  description = "user do gke"
}

variable "gke_password" {
  default     = ""
  description = "password do gke"
}

variable "gke_num_nodes" {
  default     = 2
  description = "numero de nodes para o cluster"
}

# Cluster GKE
resource "google_container_cluster" "flpmarcos_cluster" {
  name     = sensitive("${var.project_id}-gke")
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  master_auth {
    username = var.gke_username
    password = var.gke_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

# Node Pool Gerenciado Separadamente
resource "google_container_node_pool" "nodes_primarios" {
  name       = "${google_container_cluster.flpmarcos_cluster.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.flpmarcos_cluster.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = sensitive(var.project_id)
    }

    machine_type = "e2-standard-2"
    tags         = ["gke-node", sensitive("${var.project_id}-gke")]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}