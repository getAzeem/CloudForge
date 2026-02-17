output "security_group_id" {
  description = "Database security group ID"
  value       = aws_security_group.db.id
}