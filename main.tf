resource "google_compute_network" "vpc-network" {
name = "first-network"
auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "public-subnetwork" {
name = "first-subnetwork1"
ip_cidr_range = "10.2.0.0/16"
region = "us-central1"
network = google_compute_network.vpc-network.name
}
resource "google_compute_subnetwork" "public-subnetwork" {
name = "first-subnetwork1"
ip_cidr_range = "10.3.0.0/16"
region = "us-central1"
network = google_compute_network.vpc-network.name
}
 