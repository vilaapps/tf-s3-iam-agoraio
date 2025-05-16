variable "region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "riit-dev"
}

variable "environment" {
  description = "Ambiente de deploy (ex: dev, prod)"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Nome do projeto ou sistema"
  type        = string
  default     = "agora.io"
}

variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
  default     = "agoraio-recordings-dev"
}

variable "iam_user_name" {
  description = "Nome do IAM user"
  type        = string
  default     = "agoraio-recorder"
}

variable "days_to_glacier" {
  description = "Dias para mover arquivos para Glacier"
  type        = number
  default     = 15
}

variable "storage_class" {
  description = "Classe de storage para lifecycle"
  type        = string
  default     = "DEEP_ARCHIVE"
}