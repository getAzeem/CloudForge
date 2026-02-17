output "nacl_id" {
  description = "The ID of the public NACL"
  value       = aws_network_acl.public.id
}