output "bucket_name" {
  value =  aws_s3_bucket.state-store.bucket
  description = "The name of the bucket storing our statefile. Use this value in your S3 backend configuration."
}
