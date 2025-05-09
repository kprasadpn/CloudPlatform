cluster_name         = "eks-prod"
region               = "us-west-2"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
instance_type        = "t3.micro"
desired_capacity     = 1
max_size             = 2
min_size             = 1
