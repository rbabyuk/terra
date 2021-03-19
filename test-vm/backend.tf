terraform {
  backend "remote" {
    organization = "petproject"

    workspaces {
      name = "local-tf"
    }
  }
}
