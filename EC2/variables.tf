#variable "bucketlocal" {
#    type = string
#}

#variable "bucket" {
#type = string
#}

variable "instances" {
  description = "Lista de instancias EC2 do laboratorio"

  type = map(object({
    instance_type = string
    role          = string
    subnet        = string
  }))

  default = {
    web-01 = {
      instance_type = "t3.micro"
      role          = "web"
      subnet        = "public"
    }

    web-02 = {
      instance_type = "t3.micro"
      role          = "web"
      subnet        = "public"
    }

    db-01 = {
      instance_type = "t3.small"
      role          = "database"
      subnet        = "private"
    }

    monitoring-01 = {
      instance_type = "t3.micro"
      role          = "monitoring"
      subnet        = "private"
    }
  }
}