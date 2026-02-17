resource "aws_instance" "main" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name
  
  # Free tier optimized root volume
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
    encrypted   = true
  }

  # Public IP only if in public subnet
  associate_public_ip_address = var.associate_public_ip

  tags = {
    Name = var.name
  }

  user_data = var.user_data
}