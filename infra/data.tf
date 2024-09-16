data "aws_secretsmanager_secret" "postgresql_password_secret" {
  name = local.rds_postgress_password_secret_name
}

data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = local.rds_postgress_password_secret_name
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

data "aws_rds_engine_version" "postgresql" {
  engine   = "postgres"
  version  = lookup(each.value, "engine_version", "14.10")
}