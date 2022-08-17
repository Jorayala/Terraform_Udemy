terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}


provider "docker" {}

# download nodered image

resource "docker_image" "prometheus_image" {
  name = "prom/prometheus:latest"
}

# start the container

resource "docker_container" "prometheus_container" {
  name  = "prometheus"
  image = docker_image.prometheus_image.latest
  ports {
    internal = 9090
    external = 9090
  }
}