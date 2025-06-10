
# Configure the Google Cloud Provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
  zone    = "us-central1-a"
}

# Variables
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 24
}

# Create 24 e2-micro instances
resource "google_compute_instance" "e2_micro_instances" {
  count        = var.instance_count
  name         = "e2-micro-instance-${count.index + 1}"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    
    # Uncomment the line below if you want external IP addresses
    # access_config {}
  }

  # Optional: Add labels for organization
  labels = {
    environment = "development"
    created-by  = "terraform"
    instance-group = "e2-micro-batch"
  }

  # Optional: Add metadata
  metadata = {
    startup-script = "#!/bin/bash\necho 'Instance ${count.index + 1} started' > /tmp/startup.log"
  }

  tags = ["e2-micro", "batch-deployment"]
}

# Output the instance names and internal IPs
output "instance_names" {
  description = "Names of the created instances"
  value       = google_compute_instance.e2_micro_instances[*].name
}

output "instance_internal_ips" {
  description = "Internal IP addresses of the instances"
  value       = google_compute_instance.e2_micro_instances[*].network_interface.0.network_ip
}

# Uncomment if you enabled external IPs
# output "instance_external_ips" {
#   description = "External IP addresses of the instances"
#   value       = google_compute_instance.e2_micro_instances[*].network_interface.0.access_config.0.nat_ip
# }