variable "name" {
  description = "Prefixo do nome do IAM User e da policy"
  type        = string
  default     = "agoraio-recorder"
}

variable "environment" {
  description = "Ambiente (ex: dev, prod)"
  type        = string
  default     = "dev"
}

variable "bucket_arn" {
  description = "ARN do bucket S3 que o user poderá acessar"
  type        = string
}