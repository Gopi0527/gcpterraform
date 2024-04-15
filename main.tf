resource "google_compute_network" "first-vpc" {
  project                 = "My First Project"
  name                    = "first-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "first-subnet"
  network = google_compute_network.first-vpc
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
}