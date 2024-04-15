resource "google_compute_network" "vpc-network" {
name = "first-network"
auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "public-subnetwork1" {
name = "first-subnetwork1"
ip_cidr_range = "10.2.0.0/16"
region = "us-central1"
network = google_compute_network.vpc-network.name
}
resource "google_compute_subnetwork" "public-subnetwork2" {
name = "first-subnetwork1"
ip_cidr_range = "10.3.0.0/16"
region = "us-central1"
network = google_compute_network.vpc-network.name
}
resource "google_compute_firewall" "myfirewall" {
     name= "myfirewall"
    network = google_compute_network.vpc-network.name
    allow {
      protocol = "icmp"
    }
    allow {
      protocol = "tcp"
      ports = [ "22", "80","8080", "0-65235"  ]
    }
   source_ranges = [ "0.0.0.0/0" ]
}

resource "google_compute_instance" "myinstance" {
    name = "myinstance"
    machine_type = "e2-medium"
    network_interface {
      subnetwork = google_compute_subnetwork.public-subnetwork1.name
    }
    boot_disk {
      initialize_params {
        image = "ubuntu-os-cloud/ubuntu-2204-lts "
      }
    }
  
}