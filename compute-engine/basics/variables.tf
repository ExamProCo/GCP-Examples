variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "gcp-playground-1212"
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "northamerica-northeast2"
}

variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "northamerica-northeast2-b"
}

variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
  default     = "my-web-server"
}

variable "instance_description" {
  description = "Description of the compute instance"
  type        = string
  default     = "My Web Server for Showing how to start up Apache"
}

variable "machine_type" {
  description = "Machine type for the compute instance"
  type        = string
  default     = "e2-micro"
}

variable "boot_disk_image" {
  description = "Boot disk image for the compute instance"
  type        = string
  default     = "projects/debian-cloud/global/images/debian-12-bookworm-v20250513"
}

variable "boot_disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 10
}

variable "boot_disk_type" {
  description = "Boot disk type"
  type        = string
  default     = "pd-balanced"
}

variable "network_tier" {
  description = "Network tier for external IP"
  type        = string
  default     = "PREMIUM"
}

variable "service_account_email" {
  description = "Service account email for the compute instance"
  type        = string
  default     = "214543431575-compute@developer.gserviceaccount.com"
}

variable "service_account_scopes" {
  description = "Service account scopes for the compute instance"
  type        = list(string)
  default = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append"
  ]
}

variable "network_tags" {
  description = "Network tags for the compute instance"
  type        = list(string)
  default     = ["http-server", "https-server"]
}

variable "ops_agent_policy_assignment_id" {
  description = "Assignment ID for ops agent policy"
  type        = string
  default     = "goog-ops-agent-v2-x86-template-1-4-0-northamerica-northeast2-b"
}

variable "ops_agent_policy_label_value" {
  description = "Label value for ops agent policy"
  type        = string
  default     = "v2-x86-template-1-4-0"
}

variable "startup_script" {
  description = "Startup script for the compute instance"
  type        = string
  default     = <<-SCRIPT
    #! /bin/bash
    apt update
    apt -y install apache2
    cat <<EOF > /var/www/html/index.html
    <html><body><p>Linux startup script added directly.</p></body></html>
    EOF
  SCRIPT
}