terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 3
}

output "node_count" {
  value = var.node_count
}