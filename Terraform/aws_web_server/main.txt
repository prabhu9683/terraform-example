---------------------------------------------------------------------
###Deploying a webserver using infra automation terraform tool ####
---------------------------------------------------------------------
provider "aws" {
  profile = "default"
  access_key = "AKIAQSXSREO43L4PBZWR"
  secret_key = "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"
  region  = "ap-southeast-1"
}
resource "aws_instance" "web_server" {
   ami  = "ami-0c8e97a27be37adfd"
   instance_type ="t2.micro"
   vpc_security_group_ids = [aws_security_group.instance.id]

   user_data =<<-EOF
              #!/bin/bash
              echo "hello welcome to terraform automation team" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

   tags = {
     Name = "Terraform_Web_Server"
    }
}
resource "aws_security_group" "instance" {
  name = "Terraform_exa_web_Server"

  ingress  {
        from_port       = 8080
        to_port         = 8080
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        }
}
