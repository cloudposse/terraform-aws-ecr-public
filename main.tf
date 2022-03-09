locals {
  principals_full_access_non_empty = length(var.principals_full_access) > 0 ? true : false
  ecr_need_policy                  = length(var.principals_full_access) + length(var.principals_readonly_access) > 0 ? true : false
}

resource "aws_ecrpublic_repository" "this" {
  for_each        = { for o in module.this.enabled ? var.repository_configs : [] : o.name => o }
  repository_name = each.value["name"]

  catalog_data {
    about_text        = each.value.about_text
    usage_text        = each.value.usage_text
    architectures     = each.value.architectures
    description       = each.value.description
    operating_systems = each.value.operating_systems
    logo_image_blob   = each.value.logo_image_blob
  }
}

data "aws_iam_policy_document" "empty" {
  count = module.this.enabled ? 1 : 0
}

data "aws_iam_policy_document" "resource_full_access" {
  count = module.this.enabled ? 1 : 0

  statement {
    sid    = "FullAccess"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = var.principals_full_access
    }

    actions = ["ecr-public:*"]
  }
}

data "aws_iam_policy_document" "resource" {
  count       = module.this.enabled ? 1 : 0
  source_json = local.principals_full_access_non_empty ? join("", [data.aws_iam_policy_document.resource_full_access[0].json]) : join("", [data.aws_iam_policy_document.empty[0].json])
}

resource "aws_ecrpublic_repository_policy" "this" {
  for_each        = { for o in local.ecr_need_policy && module.this.enabled ? var.repository_configs : [] : o.name => o }
  repository_name = aws_ecrpublic_repository.this[each.value.name].repository_name
  policy          = join("", data.aws_iam_policy_document.resource.*.json)
}
