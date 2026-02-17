resource "aws_network_acl" "db" {
  vpc_id     = var.vpc_id
  subnet_ids = [var.db_subnet_id]
  
  # INBOUND RULES
  
  # Only allow database connections from backend
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.backend_subnet_cidr
    from_port  = var.db_port
    to_port    = var.db_port
  }
  
    # SSH from public subnet (for bastion)
  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = var.public_subnet_cidr
    from_port  = 22
    to_port    = 22
  }


  
   ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = var.backend_subnet_cidr
    from_port  = 22
    to_port    = 22
  }

  # Allow response traffic
  ingress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }
  
  # OUTBOUND RULES
  
  # Allow responses back to backend
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.backend_subnet_cidr
    from_port  = 0
    to_port    = 65535
  }
  
  # Allow response traffic
  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    Name = "${var.name}-db-nacl"
  }
}