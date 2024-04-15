terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.24.0"
    }
  }
}

provider "google" {
   credentials = file(Downloads/acoustic-cargo-416714-8da8162748ae.json)
  project     = "My First Project"
  region      = "us-central1"
}