# ============================================
# SECURITY GROUP - SERVIDORES WEB
# ============================================

resource "aws_security_group" "web" {
  name        = "web-security-group"
  description = "Security Group dos servidores web"
  vpc_id      = aws_vpc.lab.id

  tags = {
    Name        = "web-security-group"
    Environment = "lab"
    Tier        = "public"
  }
}

# SSH
resource "aws_vpc_security_group_ingress_rule" "web_ssh" {
  security_group_id = aws_security_group.web.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  description = "SSH"
}

# HTTP
resource "aws_vpc_security_group_ingress_rule" "web_http" {
  security_group_id = aws_security_group.web.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "HTTP"
}

# HTTPS
resource "aws_vpc_security_group_ingress_rule" "web_https" {
  security_group_id = aws_security_group.web.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  description = "HTTPS"
}

# Saida
resource "aws_vpc_security_group_egress_rule" "web_all" {
  security_group_id = aws_security_group.web.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Permitir toda a saida"
}


# ============================================
# SECURITY GROUP - SERVIDORES PRIVADOS
# ============================================

resource "aws_security_group" "private" {
  name        = "private-security-group"
  description = "Security Group dos servidores privados"
  vpc_id      = aws_vpc.lab.id

  tags = {
    Name        = "sg-private"
    Environment = "lab"
    Tier        = "private"
  }
}

# SSH
resource "aws_vpc_security_group_ingress_rule" "private_ssh" {
  security_group_id = aws_security_group.private.id

  cidr_ipv4   = "10.0.1.0/24"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  description = "SSH somente da subnet publica"
}

# MySQL
resource "aws_vpc_security_group_ingress_rule" "private_mysql" {
  security_group_id = aws_security_group.private.id

  cidr_ipv4   = "10.0.1.0/24"
  from_port   = 3306
  to_port     = 3306
  ip_protocol = "tcp"

  description = "MySQL da subnet publica"
}

# Saida
resource "aws_vpc_security_group_egress_rule" "private_all" {
  security_group_id = aws_security_group.private.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Permitir toda a saida"
}