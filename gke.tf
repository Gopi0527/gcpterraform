resource "google_container_cluster" "gke" {
  name               = "gopigke"
  location           = "us-central1"
  initial_node_count = 1
  network            = google_compute_network.vpc-network.name
  subnetwork         = google_compute_subnetwork.public-subnetwork1.name

}

resource "google_container_node_pool" "nodepool" {
  cluster    = google_container_cluster.gke.name
  node_count = 2
  node_config {
    preemptible  = false
    machine_type = "e2-medium"
  }

}