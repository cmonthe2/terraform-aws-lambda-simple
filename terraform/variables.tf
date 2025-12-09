variable "region" {
  description = "The AWS region to deploy the Lambda function in."
  type        = string
  default     = "us-east-1"
}
variable "function_name" {
  type    = string
  default = "simple-lambda"
}
variable "handler" {
  type    = string
  default = "handler.handler"
}
variable "runtime" {
  type    = string
  default = "python3.11"
}
variable "lambda_role_name" {
  type    = string
  default = "lambda_simple_role"
}
variable "environment" {
  type    = map(string)
  default = {}
}
variable "timeout" {
  type    = number
  default = 10
}
variable "memory_size" {
  type    = number
  default = 128
}
variable "additional_policy_statements" {
  type    = list(object({ Effect = string, Action = list(string), Resource = list(string) }))
  default = []
}
