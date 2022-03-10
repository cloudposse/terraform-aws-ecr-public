provider "aws" {
  region = var.region
}

module "ecrpublic" {
  source = "../../"

  context = module.this.context
  repository_configs = [{
    name              = module.this.id
    description       = null
    about_text        = null
    usage_text        = null
    architectures     = []
    operating_systems = []
    logo_image_blob   = null
  }]
}
