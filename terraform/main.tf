module "s3_recordings" {
  source          = "./modules/s3_recordings"
  bucket_name     = var.bucket_name
  days_to_glacier = var.days_to_glacier
  storage_class   = var.storage_class
  project         = var.project
  environment     = var.environment
}

module "iam_recorder_user" {
  source      = "./modules/iam_recorder_user"
  name        = var.iam_user_name
  environment = var.environment
  bucket_arn  = module.s3_recordings.bucket_arn
}