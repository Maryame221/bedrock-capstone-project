resource "aws_secretsmanager_secret" "mysql" {
  name = "bedrock-mysql-secret"

  tags = {
    Project = "karatu-2025-capstone"
  }
}

resource "aws_secretsmanager_secret_version" "mysql" {
  secret_id = aws_secretsmanager_secret.mysql.id

  secret_string = jsonencode({
    username = "admin"
    password = "StrongPassword123!"
  })
}
resource "aws_secretsmanager_secret" "postgres" {
  name = "bedrock-postgres-secret"

  tags = {
    Project = "karatu-2025-capstone"
  }
}

resource "aws_secretsmanager_secret_version" "postgres" {
  secret_id = aws_secretsmanager_secret.postgres.id

  secret_string = jsonencode({
    username = "dbadmin"
    password = "StrongPassword123!"
  })
}

