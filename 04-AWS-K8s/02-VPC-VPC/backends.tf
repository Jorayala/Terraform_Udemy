terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Cris_Corp"

    workspaces {
      name = "mtc-aws"
    }
  }
}