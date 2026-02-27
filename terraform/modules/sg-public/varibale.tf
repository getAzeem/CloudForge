variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "name" {
  description = "Name prefix"
  type        = string
  default     = "main"
}

variable "my_ip" {
  description = "My IP for SSH access"
  type        = string
  default     = "0.0.0.0/0" # Change this to your actual IP!
}

