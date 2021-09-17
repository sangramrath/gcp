terraform {
  required_providers {
      google = {
        source = "hashicorp/google"
      }
  }
}
provider "google" {
  version = "3.5.0"
  project = "global-course-228918"
  region = "us-central1"
  zone = "us-central1-a"
}
resource "google_compute_network" "tf-network" {
  name = "tf-demo-network"
}
resource "google_compute_subnetwork" "tf-subnet-usc1" {
  name = "tf-demo-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region = "us-central1"
}

resource "google_compute_instance" "tf-instance" {
  depends_on = [
    google_storage_bucket.tf-bucket
  ]
  name = "tf-demo-instance"
  machine_type = "f1-micro"
  zone = "us-central1-f"
  boot_disk {
    initialize_params {
        image = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network = google_compute_network.tf-network.name
    access_config {
      
    }
  }
}
resource "google_storage_bucket" "tf-bucket" {
  name = "global-course-228918-tf-bucket"
  location = "US"
}
