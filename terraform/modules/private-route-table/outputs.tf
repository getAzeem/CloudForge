output "route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private.id
}

output "route_table_arn" {
  description = "The ARN of the private route table"
  value       = aws_route_table.private.arn
}

output "association_ids" {
  description = "List of route table association IDs"
  value       = aws_route_table_association.private[*].id
}