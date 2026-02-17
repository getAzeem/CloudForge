variable "vpc_id" {
  description = "The VPC ID for the route table"
  type        = string
}

variable "nat_gateway_id" {
  description = "The NAT Gateway ID for internet access"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs (both backend and DB subnets)"
  type        = list(string)
  default     = []
}

variable "name" {
  description = "Name prefix for resources"
  type        = string
  default     = "main"
}

