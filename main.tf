provider "aws" {
    region = var.region
}

resource "aws_instance" "web" {
    ami = var.ami_id
    instance_type = var.instance.type

    tags = {
      "name" = var.tag
    }
}
