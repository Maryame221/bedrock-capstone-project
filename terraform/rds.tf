# DATA: DB Subnet Group

resource "aws_db_subnet_group" "bedrock_db_subnets" {
  name       = "bedrock-db-subnets"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name    = "bedrock-db-subnets"
    Project = "karatu-2025-capstone"
  }
}


# SECURITY GROUP FOR RDS

resource "aws_security_group" "rds_sg" {
  name        = "bedrock-rds-sg"
  description = "Allow EKS access to RDS"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "MySQL from EKS"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  ingress {
    description = "PostgreSQL from EKS"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "karatu-2025-capstone"
  }
}


# MYSQL RDS

resource "aws_db_instance" "mysql" {
  identifier     = "bedrock-mysql"
  engine         = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_encrypted = true

  db_name  = "retail"
  username = "admin"
  password = "StrongPassword123!"

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.bedrock_db_subnets.name

  skip_final_snapshot = true
  publicly_accessible = false

  tags = {
    Project = "karatu-2025-capstone"
  }
}


# POSTGRES RDS

resource "aws_db_instance" "postgres" {
  identifier     = "bedrock-postgres"
  engine         = "postgres"
  engine_version = "15"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_encrypted = true

  db_name  = "orders"
  username = "dbadmin"
  password = "StrongPassword123!"

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.bedrock_db_subnets.name

  skip_final_snapshot = true
  publicly_accessible = false

  tags = {
    Project = "karatu-2025-capstone"
  }
}