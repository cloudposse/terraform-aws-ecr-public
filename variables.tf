variable "use_fullname" {
  type        = bool
  default     = true
  description = "Set 'true' to use `namespace-stage-name` for ecr repository name, else `name`"
}

variable "principals_full_access" {
  type        = list(string)
  description = "Principal ARNs to provide with full access to the ECR"
  default     = []
}

variable "principals_readonly_access" {
  type        = list(string)
  description = "Principal ARNs to provide with readonly access to the ECR"
  default     = []
}

variable "repository_configs" {
  description = <<EOF
  `name`: List of Docker local image names, used as repository names for AWS ECR 
  
  `description`: A short description of the contents of the repository. This text appears in both the image details and 
  also when searching for repositories on the Amazon ECR Public Gallery.

  `about_text`: A detailed description of the contents of the repository. It is publicly visible in the Amazon ECR Public 
  Gallery. The text must be in markdown format.

  `usage_text`: Detailed information on how to use the contents of the repository. It is publicly visible in the Amazon 
  ECR Public Gallery. The usage text provides context, support information, and additional usage details for users of 
  the repository. The text must be in markdown format.

  `architectures`: The system architecture that the images in the repository are compatible with. On the Amazon ECR 
  Public Gallery, the following supported architectures will appear as badges on the repository and are used as search 
  filters: ARM, ARM 64, x86, x86-64

  `operating_systems`: The operating systems that the images in the repository are compatible with. On the Amazon ECR 
  Public Gallery, the following supported operating systems will appear as badges on the repository and are used as 
  search filters: Linux, Windows

  `logo_image_blob`: The base64-encoded repository logo payload. (Only visible for verified accounts) Note that drift 
  detection is disabled for this attribute.

  EOF
  type = list(object({
    name              = string
    description       = string
    about_text        = string
    usage_text        = string
    architectures     = list(string)
    operating_systems = list(string)
    logo_image_blob   = string
  }))
}
