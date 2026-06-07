output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "region" {
  value = var.region
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "assets_bucket_name" {
  value = aws_s3_bucket.assets.bucket
}

output "mysql_endpoint" {
  value = aws_db_instance.mysql.address
}

output "postgres_endpoint" {
  value = aws_db_instance.postgres.address
}

output "lambda_function_name" {
  value = aws_lambda_function.asset_processor.function_name
}