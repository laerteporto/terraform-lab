
# ============================================
# SUBNET PUBLICA
# ============================================

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.lab.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name        = "subnet-public"
    Environment = "lab"
    Tier        = "public"
  }
}

# ============================================
# SUBNET PRIVADA
# ============================================

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.lab.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name        = "subnet-private"
    Environment = "lab"
    Tier        = "private"
  }
}