variable "name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-0b9093ea00a0fed92" # Ubuntu 22.04 in ap-south-1 (Free Tier eligible)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "m7i-flex.large" # Free Tier eligible
}

variable "subnet_id" {
  description = "Subnet ID where instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)

}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 8 # Free Tier includes 30GB, but 8GB is minimum for Ubuntu
}

variable "volume_type" {
  description = "Root volume type"
  type        = string
  default     = "gp2" # Free Tier includes gp2
}

variable "associate_public_ip" {
  description = "Whether to assign public IP (use for public subnets only)"
  type        = bool
  default     = true
}

variable "user_data" {
  description = "User data script for instance initialization"
  type        = string
  default     = ""
}