//###### VPC  #####//

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}


output "public_subnet_ids" {
  value = [
    module.public-subnet.subnet_id

  ]
}


//###### Public route table  #####//
output "public-route-table-id" {
  value = module.public-route-table.route_table_id
}

output "route_table_arn" {
  value = module.public-route-table.route_table_arn
}

output "association_id" {
  description = "The route table association ID"
  value       = module.public-route-table.association_id
}

output "public_nacl_id" {
  description = "The ID of the public NACL"
  value       = module.nacl-public.nacl_id
}


output "public_sg_id" {
  description = "Public security group ID"
  value       = module.sg-public.security_group_id
}




output "master_instance_id" {
  description = "EC2 instance ID"
  value       = module.master-node.instance_id
}

output "master_private_ip" {
  description = "Private IP address"
  value       = module.master-node.private_ip
}

output "master_public_ip" {
  description = "Public IP address (if assigned)"
  value       = module.master-node.public_ip
}




output "worker_node_1_instance_id" {
  description = "EC2 instance ID"
  value       = module.worker-node-1.instance_id
}

output "worker_node_1_private_ip" {
  description = "Private IP address"
  value       = module.worker-node-1.private_ip
}

output "worker_node_1_public_ip" {
  description = "Public IP address (if assigned)"
  value       = module.worker-node-1.public_ip
}



output "worker_node_2_instance_id" {
  description = "EC2 instance ID"
  value       = module.worker-node-2.instance_id
}

output "worker_node_2_private_ip" {
  description = "Private IP address"
  value       = module.worker-node-2.private_ip
}

output "worker_node_2_public_ip" {
  description = "Public IP address (if assigned)"
  value       = module.worker-node-2.public_ip
}