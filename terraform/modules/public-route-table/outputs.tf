output "route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}

output "route_table_arn" {
  description = "The ARN of the public route table"
  value       = aws_route_table.public.arn
}

output "association_id" {
  description = "The route table association ID"
  value       = aws_route_table_association.public.id
}