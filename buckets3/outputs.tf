# Exibe a URL local para você clicar e testar o site no navegador
output "site_url" {
  description = "URL do site estático no LocalStack"
  value       = "http://${aws_s3_bucket.static_site.id}.s3-website.localhost.localstack.cloud:4566"
}

# Exibe o nome exato do bucket criado
output "bucket_name" {
  description = "Nome do bucket S3 criado"
  value       = aws_s3_bucket.static_site.id
}