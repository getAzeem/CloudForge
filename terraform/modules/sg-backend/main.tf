resource "aws_security_group" "backend" {
  name        = "${var.name}-backend-sg"
  description = "Security group for backend application servers"
  vpc_id      = var.vpc_id

  # Allow app port from public subnet only
  ingress {
    description = "App port from public subnet"
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  # Allow SSH from public subnet (for bastion access)
  ingress {
    description = "SSH from public subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  #   # Allow SSH from my IP (direct access)
  #   ingress {
  #     description = "SSH from my IP"
  #     from_port   = 22
  #     to_port     = 22
  #     protocol    = "tcp"
  #     cidr_blocks = [var.my_ip]
  #   }

  # Allow internal communication between backend instances
  ingress {
    description = "Internal backend communication"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.backend_subnet_cidr]
  }

  # Allow all outbound traffic
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-backend-sg"
  }
}