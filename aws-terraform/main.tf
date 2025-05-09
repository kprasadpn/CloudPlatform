provider "aws" {
  region = var.region
}

module "vpc" {
  source              = "./modules/vpc"
  region              = var.region
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source           = "./modules/eks"
  cluster_name     = var.cluster_name
  subnet_ids       = module.vpc.public_subnet_ids
  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size
  instance_type    = var.instance_type
}

module "remote_state" {
  source              = "./modules/remote-state"
  bucket_name         = "your-eks-prod-tfstate"         # Replace with a unique name
  dynamodb_table_name = "eks-prod-lock"
}

