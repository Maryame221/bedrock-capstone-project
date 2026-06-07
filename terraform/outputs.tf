output "vpc_id" {
  value = module.vpc.vpc_id
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