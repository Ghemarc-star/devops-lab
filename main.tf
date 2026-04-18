variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 3
}

output "node_count" {
  value = var.node_count
}
