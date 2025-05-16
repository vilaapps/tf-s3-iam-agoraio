output "access_key_id" {
  description = "Access Key do IAM user"
  value       = module.iam_recorder_user.access_key_id
}

output "secret_access_key" {
  description = "Secret Access Key do IAM user"
  value       = module.iam_recorder_user.secret_access_key
  sensitive   = true
}