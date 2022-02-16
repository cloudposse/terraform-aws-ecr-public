provider "aws" {
  region = var.region
}

module "ecr" {
  source = "../../"

  context = module.this.context
}
