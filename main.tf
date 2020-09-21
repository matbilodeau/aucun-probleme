provider "google" {
  project = "a2020-cr460"
  credentials = "account.json"
  region  = "us-east1"
  zone    = "us-east1-c"
}

resource "google_compute_instance" "vault" {
  name         = "vault"
  machine_type = "f1-micro"
  zone         = "us-east1-c"
  tags         = ["public"]

  boot_disk {
    initialize_params {
      image = "fedora-coreos-cloud/fedora-coreos-stable"
    }
  }

  network_interface {
    network = "default"
    access_config {

    }
  }
}

resource "google_compute_instance" "vault2" {
  name         = "vault2"
  machine_type = "f1-micro"
  zone         = "us-east1-c"

  boot_disk {
    initialize_params {
      image = "fedora-coreos-cloud/fedora-coreos-stable"
    }
  }

  network_interface {
    network = "default"
    access_config {

    }
  }
}

resource "google_compute_network" "cr460demo" {
  name                    = "cr460demo"
  auto_create_subnetworks = "true"
}
