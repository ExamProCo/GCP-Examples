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
