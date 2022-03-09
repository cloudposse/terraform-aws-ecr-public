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

variable "image_names" {
  type        = list(string)
  default     = []
  description = "List of Docker local image names, used as repository names for AWS ECR "
}

variable "about_text" {
  description = <<EOF
  A detailed description of the contents of the repository. It is publicly visible in the Amazon ECR Public Gallery. 
  The text must be in markdown format.
  EOF
  type        = string
  default     = null
}

variable "architectures" {
  description = <<EOF
   The system architecture that the images in the repository are compatible with. On the Amazon ECR Public Gallery, the 
   following supported architectures will appear as badges on the repository and are used as search filters: 
   ARM, ARM 64, x86, x86-64
   EOF
  type        = list(string)
  default     = []
}
variable "description" {
  description = <<EOF
  A short description of the contents of the repository. This text appears in both the image details and also when 
  searching for repositories on the Amazon ECR Public Gallery.
  EOF
  type        = string
  default     = null
}
variable "operating_systems" {
  description = <<EOF
  The operating systems that the images in the repository are compatible with. On the Amazon ECR Public Gallery, the 
  following supported operating systems will appear as badges on the repository and are used as search filters: 
  Linux, Windows
  EOF
  type        = list(string)
  default     = []
}
variable "usage_text" {
  type        = string
  description = <<EOF
  Detailed information on how to use the contents of the repository. It is publicly visible in the Amazon ECR Public 
  Gallery. The usage text provides context, support information, and additional usage details for users of the 
  repository. The text must be in markdown format.
  EOF
}
variable "logo_image_blob" {
  description = <<EOF
  The base64-encoded repository logo payload. (Only visible for verified accounts) Note that drift detection is disabled 
  for this attribute.
  EOF
  type        = string
  default     = null
}
