terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}


provider "docker" {}

# download nodered image

resource "docker_image" "grafana_image" {
  name = "grafana/grafana:latest"
}

# start the container

resource "docker_container" "grafana_container" {
  name  = "grafana"
  image = docker_image.grafana_image.latest
  ports {
    internal = 3000
    external = 3000
  }
}