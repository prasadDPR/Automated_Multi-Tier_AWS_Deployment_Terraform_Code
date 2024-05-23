terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "aws-tfstate-file"

    workspaces {
      name = "cicd-aws-project"
    }
  }
}
