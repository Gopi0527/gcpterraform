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
name = "first-subnetwork2"
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
    zone = "us-central1-a"
    network_interface {
      subnetwork = google_compute_subnetwork.public-subnetwork1.id
      access_config {}
    }
    boot_disk {
      initialize_params {
        image = "ubuntu-os-cloud/ubuntu-2004-focal-v20220712"
      }
    }
   metadata = {
    ssh-keys = "gopikrishnaqt:${file("~/.ssh/id_rsa.pub")}"
  }
    metadata_startup_script = "sudo apt update && sudo apt install apache2 -y"
  
}