variable "vpc_id" {
  description = "The VPC ID where the route table will be created"
  type        = string
}

variable "internet_gateway_id" {
  description = "The Internet Gateway ID for the default public route"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID to associate with this route table"
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