variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "name" {
  description = "Name prefix"
  type        = string
  default     = "main"
}

variable "backend_subnet_cidr" {
  description = "Backend subnet CIDR for database access"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR for SSH access"
  type        = string
}

variable "db_port" {
  description = "Database port"
  type        = number
  default     = 27017  # MongoDB default port
}

variable "my_ip" {
  description = "My IP for direct SSH access"
  type        = string
  default     = "0.0.0.0/0"  # Change to your actual IP!
}