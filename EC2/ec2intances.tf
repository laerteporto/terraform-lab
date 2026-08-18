resource "aws_instance" "lab" {

  for_each = var.instances

  ami           = "ami-df5de72bdb3b"
  instance_type = each.value.instance_type

  subnet_id = each.value.subnet == "public" ? aws_subnet.public.id : aws_subnet.private.id

  vpc_security_group_ids = [
    each.value.subnet == "public"
    ? aws_security_group.web.id
    : aws_security_group.private.id
  ]


  tags = {
    Name        = each.key
    Environment = "lab"
    Role        = each.value.role
    Tier        = each.value.subnet
  }
}