
resource "random_password" "randpass" {
  length  = 32
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.36"
    }
  }

  required_version = "~> 1.5"

}

data "aws_region" "this" {}

resource "aws_secretsmanager_secret" "secret" {
    description = "A secret who's values will vary by terragrunt config"
    recovery_window_in_days = 0 # force delete on tf destroy
    name = join(
        "-",
        [var.prefix,
        var.valuesuffix,
        data.aws_region.this.name]
    )
}

resource "aws_secretsmanager_secret_version" "hcdb_secret_version" {
  secret_id = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode({
    prefix = var.prefix
    keysuffix = var.keysuffix
    valuesuffix = vary.valuesuffix
    region = data.aws_region.this.name
  })
}