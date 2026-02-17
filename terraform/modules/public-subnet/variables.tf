variable "name" {
  description = "Name prefix for the subnet"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the subnet will be created"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for the subnet"
  type        = string
}

variable "tags" {
  description = "Additional tags for the subnet"
  type        = map(string)
  default     = {}
}
