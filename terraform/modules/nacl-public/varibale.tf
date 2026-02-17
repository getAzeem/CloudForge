variable "vpc_id" {
  description = "VPC ID where NACL will be created"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID to associate with NACL"
  type        = string
}

variable "name" {
  description = "Name prefix for NACL"
  type        = string
  default     = "main"
}

variable "ssh_cidr_block" {
  description = "CIDR block allowed for SSH access"
  type        = string
  default     = "0.0.0.0/0"  # Change to your IP for security
}