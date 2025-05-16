variable "bucket_name" {
  description = "Nome completo do bucket S3"
  type        = string
}

variable "days_to_glacier" {
  description = "Número de dias para mover objetos para o Glacier"
  type        = number
  default     = 15
}

variable "storage_class" {
  description = "Classe de armazenamento de destino (ex: GLACIER, GLACIER_IR, DEEP_ARCHIVE)"
  type        = string
  default     = "DEEP_ARCHIVE"
}

variable "project" {
  description = "Nome do projeto"
  type        = string
  default     = "agora.io"
}

variable "environment" {
  description = "Ambiente (dev, prod, etc)"
  type        = string
  default     = "dev"
}