module "vpc" {
  source          = "../../modules/vpc"
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  tags = {
    Environment = "dev"
    Project     = "k8s-cluster"
  }
}

module "public-subnet" {
  source            = "../../modules/public-subnet"
  name              = var.vpc_name
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.public_subnets[0]
  availability_zone = var.azs[0]

}

module "public-route-table" {
  source              = "../../modules/public-route-table"
  name                = var.vpc_name
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.vpc.internet_gateway_id
  public_subnet_id    = module.public-subnet.subnet_id

}


module "nacl-public" {
  source           = "../../modules/nacl-public"
  name             = var.vpc_name
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.public-subnet.subnet_id
}


module "sg-public" {
  source = "../../modules/sg-public"
  name   = var.vpc_name
  vpc_id = module.vpc.vpc_id
}

module "master-node" {
  source = "../../modules/ec2"

  name          = "master-node"
  ami_id        = var.ami_id
  instance_type = "m7i-flex.large"

  subnet_id           = module.public-subnet.subnet_id
  security_group_ids  = [module.sg-public.security_group_id]
  key_name            = "k8s"
  associate_public_ip = true
}

module "worker-node-1" {
  source = "../../modules/ec2"

  name          = "worker-node-1"
  ami_id        = var.ami_id
  instance_type = "m7i-flex.large"

  subnet_id           = module.public-subnet.subnet_id
  security_group_ids  = [module.sg-public.security_group_id]
  key_name            = "k8s"
  associate_public_ip = true

  volume_size = 20
  volume_type = "gp3"
}


module "worker-node-2" {
  source = "../../modules/ec2"

  name          = "worker-node-2"
  ami_id        = var.ami_id
  instance_type = "m7i-flex.large"

  subnet_id           = module.public-subnet.subnet_id
  security_group_ids  = [module.sg-public.security_group_id]
  key_name            = "k8s"
  associate_public_ip = true

  volume_size = 20
  volume_type = "gp3"
}


module "Jenkins-worker" {
  source = "../../modules/ec2"

  name          = "Jenkins-worker"
  ami_id        = var.ami_id
  instance_type = "m7i-flex.large"

  subnet_id           = module.public-subnet.subnet_id
  security_group_ids  = [module.sg-public.security_group_id]
  key_name            = "k8s"
  associate_public_ip = true
}


