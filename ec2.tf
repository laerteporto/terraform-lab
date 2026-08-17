# 1. Declaração do Host que o Terraform precisa encontrar
resource "aws_ec2_host" "test" {
  availability_zone = "us-east-1"
  instance_type     = "t2.micro"
}

# 2. Sua instância atualizada que faz referência ao Host acima
resource "aws_instance" "vmteste" {
  ami           = "ami-df5de72bdb3b"
  instance_type = "t2.micro"
  host_id       = aws_ec2_host.test.id
}