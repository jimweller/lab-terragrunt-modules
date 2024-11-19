# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "prefix" {
  description = "The prefix for both the SSM parameter key and value"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

# Show terragrunt using version modules
# v1 will not support a suffix. v2 will.
variable "keysuffix" {
  description = "The suffix string appended to the end of the prefix for SSM param KEY."
  type        = string
  default     = "key"
}

variable "valuesuffix" {
  description = "The suffix string appended to the end of the prefix for SSM param VALUE."
  type        = string
  default     = "value"
}
