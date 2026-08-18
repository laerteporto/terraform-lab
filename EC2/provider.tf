provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"

  # Evita que o Terraform tente validar as credenciais nos servidores reais da AWS
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  # Redireciona os serviços para o LocalStack
  endpoints {
    s3control = "http://localhost:4566"
    s3        = "http://localhost:4566"
    dynamodb  = "http://localhost:4566"
    lambda    = "http://localhost:4566"
    iam       = "http://localhost:4566"
    ec2       = "http://localhost:4566"
    ecr       = "http://localhost:4566"
    ecs       = "http://localhost:4566"
  }
}
