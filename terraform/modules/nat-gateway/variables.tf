variable "public_subnet_id" {
  description = "Public subnet ID where NAT Gateway will be placed"
  type        = string
}

variable "name" {
  description = "Name prefix for resources"
  type        = string
  default     = "main"
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}