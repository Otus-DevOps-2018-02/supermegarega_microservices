resource "google_container_cluster" "primary" {
  name               = "reddit"
  zone               = "europe-west1-b"
  initial_node_count = 2
  project            = "${var.project}"

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    machine_type = "${var.machine_type}"
    disk_size_gb = "20"

    labels {
      app = "reddit"
    }
  }
}

resource "google_compute_firewall" "firewall_kubernetes" {
  name    = "reddit-kubernetes"
  network = "default"
  project = "${var.project}"

  allow {
    protocol = "tcp"
    ports    = ["30000-32767"]
  }

  description   = "Create firewall rule for kubernetes."
  source_ranges = ["0.0.0.0/0"]
}
