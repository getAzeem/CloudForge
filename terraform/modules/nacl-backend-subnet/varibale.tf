variable "vpc_id" {
  description = "My VPC ID"
  type        = string
}

variable "backend_subnet_id" {
  description = "My backend subnet ID"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Frontend subnet range"
  type        = string
}

variable "backend_subnet_cidr" {
  description = "Backend subnet range"
  type        = string
}

variable "db_subnet_cidr" {
  description = "Database subnet range"
  type        = string
}

variable "app_port" {
  description = "My backend app port"
  type        = number
  default     = 5000
}

variable "db_port" {
  description = "My database port"
  type        = number
  default     = 5432
}

variable "name" {
  description = "Name for this NACL"
  type        = string
  default     = "main"
}

variable "my_ip" {
  description = "My personal IP for SSH access"
  type        = string
  default     = "192.168.1.100/32" # Change this to your actual IP
}