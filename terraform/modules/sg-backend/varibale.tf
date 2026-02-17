variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "name" {
  description = "Name prefix"
  type        = string
  default     = "main"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR for frontend access"
  type        = string
}

variable "backend_subnet_cidr" {
  description = "Backend subnet CIDR for internal communication"
  type        = string
}

variable "app_port" {
  description = "Backend application port"
  type        = number
  default     = 5000
}

# variable "my_ip" {
#   description = "My IP for SSH access"
#   type        = string
#   default     = "0.0.0.0/0"  # Change this to your actual IP!
# }