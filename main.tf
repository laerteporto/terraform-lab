# Recurso de teste: Criação de um Bucket S3 local
resource "aws_s3_bucket" "bucket_local" {
  bucket = "bucket-localstack"
  #bucket = var.bucketlocal
}

