output "cluster_name" {
  value = var.cluster_name
}

output "kubeconfig_command" {
  value = "aws eks update-kubeconfig --name ${var.cluster_name} --region ${var.region}"
}

