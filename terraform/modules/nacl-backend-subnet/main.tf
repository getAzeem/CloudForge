resource "aws_network_acl" "backend" {
  vpc_id     = var.vpc_id
  subnet_ids = [var.backend_subnet_id]
  
  # INBOUND RULES
  
  # Let frontend talk to my backend app
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.public_subnet_cidr
    from_port  = var.app_port
    to_port    = var.app_port
  }
  
  # Backend instances can talk to each other
  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = var.backend_subnet_cidr
    from_port  = 0
    to_port    = 65535
  }
  
  # SSH from public subnet (for bastion)
  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = var.public_subnet_cidr
    from_port  = 22
    to_port    = 22
  }
  
  # SSH from my personal IP
  ingress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = var.my_ip
    from_port  = 22
    to_port    = 22
  }
  
  # Allow response traffic
  ingress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }
  
  # OUTBOUND RULES
  
  # Connect to database
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.db_subnet_cidr
    from_port  = var.db_port
    to_port    = var.db_port
  }
  
  # Allow all outbound - NAT Gateway handles internet
  egress {
    protocol   = "-1"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.name}-backend-nacl"
  }
}