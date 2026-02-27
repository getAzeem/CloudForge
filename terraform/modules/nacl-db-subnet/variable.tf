variable "vpc_id" {
  description = "My VPC ID"
  type        = string
}

variable "db_subnet_id" {
  description = "My database subnet ID"
  type        = string
}

variable "backend_subnet_cidr" {
  description = "Backend subnet range"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Backend subnet range"
  type        = string
}

variable "my_ip" {
  description = "My IP for SSH access"
  type        = string
  default     = "122.161.50.7/32" # Change this to your actual IP!
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

