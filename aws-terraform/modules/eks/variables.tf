variable "cluster_name" {}
variable "subnet_ids" {
  type = list(string)
}
variable "cluster_role_arn" {}
variable "node_role_arn" {}
variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}
variable "instance_type" {}

