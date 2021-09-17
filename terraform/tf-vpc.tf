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
