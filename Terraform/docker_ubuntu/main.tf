-----------------------------------------------------------------------
### Deploying a ubuntu server using infra automation terraform tool ###
-----------------------------------------------------------------------
terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "ubuntu" {
  name         = "ubuntu:latest"
  keep_locally = false
}
resource "docker_container" "ubuntu" {
  image = docker_image.ubuntu.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8080
  }
}
