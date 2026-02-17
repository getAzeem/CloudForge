resource "aws_security_group" "public" {
  name        = "${var.name}-public-sg"
  description = "Security group for public subnet servers"
  vpc_id      = var.vpc_id

  # Allow HTTP from anywhere
  ingress {
    description = "HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS from anywhere
  ingress {
    description = "HTTPS from internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow React app port
  ingress {
    description = "React app port"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH only from my IP
  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  # Kubernetes API
ingress {
  description     = "K8s API server"
  from_port       = 6443
  to_port         = 6443
  protocol        = "tcp"
  security_groups = [aws_security_group.public.id]
}

# Kubelet
ingress {
  description     = "Kubelet"
  from_port       = 10250
  to_port         = 10250
  protocol        = "tcp"
  security_groups = [aws_security_group.public.id]
}

# Node-to-node communication
ingress {
  description     = "Node to node all traffic"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  security_groups = [aws_security_group.public.id]
}

# NodePort services
ingress {
  description = "NodePort range"
  from_port   = 30000
  to_port     = 32767
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
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
    Name = "${var.name}-public-sg"
  }
}