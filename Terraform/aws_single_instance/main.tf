-------------------------------------------------------------------
###Deploying single aws instance using terraform automation tool###
-------------------------------------------------------------------
provider "aws" {
     access_key = "ACCESS_KEY"
     secret_key = "SECRET_KEY"
     region = "ap-southeast-1"
 }
 resource "aws_instance" "TEST-EC2" {
     ami = "ami-0ba0ce0c11eb723a1"
     instance_type = "t2.micro"
}
