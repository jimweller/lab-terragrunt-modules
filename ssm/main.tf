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

resource "aws_ssm_parameter" "param" {
  description = "A basic SSM parameter that will be constructed by variables that can differ for different environments or regions by using terragrunt"
  type        = "String"
  name        = join(
                    "-",
                    [var.prefix,
                    var.keysuffix,
                    data.aws_region.this.name]
                )
  value       = join(
                    "-",
                    [var.prefix,
                    var.valuesuffix,
                    data.aws_region.this.name]
                )
}
