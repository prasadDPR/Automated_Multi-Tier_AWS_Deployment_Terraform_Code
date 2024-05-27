terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "aws-statetf-org"

    workspaces {
      name = "cicd-aws-project"
    }
  }
}
