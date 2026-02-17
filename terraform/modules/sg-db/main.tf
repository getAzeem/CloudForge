resource "aws_security_group" "db" {
  name        = "${var.name}-db-sg"
  description = "Security group for database servers"
  vpc_id      = var.vpc_id

  # Allow database port from backend subnet only
  ingress {
    description = "Database access from backend"
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = [var.backend_subnet_cidr]
  }

  # Allow SSH from public subnet (for management)
  ingress {
    description = "SSH from public subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  ingress {
    description = "SSH from public subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.backend_subnet_cidr]
  }

  # # Allow SSH from my IP (direct access)
  # ingress {
  #   description = "SSH from my IP"
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = [var.my_ip]
  # }

  # Allow all outbound traffic
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-db-sg"
  }
}