output "security_group_id" {
  description = "Public security group ID"
  value       = aws_security_group.public.id
}