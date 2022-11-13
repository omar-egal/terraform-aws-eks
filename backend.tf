#---root/backend.tf---

terraform {
  cloud {
    organization = "omar-egal-terraform"

    workspaces {
      name = "terraform-aws-eks"
    }
  }
}