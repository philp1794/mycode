terraform {
  # comment 1 
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0" // comment 2 testing slashes
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:1.19.6"
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  /* adding ports
  here to connect to */
  ports {
    internal = 80
    external = 2224
  }
}

