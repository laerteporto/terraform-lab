#Cria bucket s3
resource "aws_s3_bucket" "static_site" {
  bucket = "site-estatico"
  #bucket = var.bucket #variavel no arquivo terraform.tfvars

}

#Configura o bucket para hospedar o site 
resource "aws_s3_bucket_website_configuration" "site_config" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
    suffix = "index.html"
  }
}

#Desativa o blqueio acesso publico
resource "aws_s3_bucket_public_access_block" "allow_public" {
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#Define a politica do bucket para leitura
resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket = aws_s3_bucket.static_site.id

  # JSON compactado em linha única resolve o bug de parseamento do LocalStack
  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"PublicReadGetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":\"s3:GetObject\",\"Resource\":\"arn:aws:s3:::${aws_s3_bucket.static_site.id}/*\"}]}"

  depends_on = [aws_s3_bucket_public_access_block.allow_public]
}