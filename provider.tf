terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.24.0"
    }
  }
}

provider "google" {
   credentials = file("/home/gopikrishnaqt/gcpterraform/acoustic-cargo-416714-8da8162748ae.json")
  project     = "acoustic-cargo-416714"
  region      = "us-central1"
}