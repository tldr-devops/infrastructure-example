# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
variable "executable_users" {
  description = "(Optional) Limit search to users with explicit launch permission on the image. Valid items are the numeric account ID or self."
  type        = list(string)
  default     = null
}

variable "most_recent" {
  description = "(Optional) If more than one result is returned, use the most recent AMI."
  type        = bool
  default     = true
}

variable "name_regex" {
  description = "(Optional) Regex string to apply to the AMI list(string) returned by AWS. This allows more advanced filtering not supported from the AWS API. This filtering is done locally on what AWS returns, and could have a performance impact if the result is large. Combine this with other options to narrow down the list(string) AWS returns."
  type        = string
  default     = ""
}

variable "owners" {
  description = "(Optional) list(string) of AMI owners to limit search. Valid values: an AWS account ID, self (the current account), or an AWS owner alias (e.g., amazon, aws-marketplace, microsoft)."
  type        = list(string)
  default     = ["amazon"]
}

variable "include_deprecated" {
  description = "(Optional) If true, all deprecated AMIs are included in the response. If false, no deprecated AMIs are included in the response. If no value is specified, the default value is false."
  type        = bool
  default     = false
}

variable "filter_name" {
  description = "(Optional) list(string) of AMI names for filtering."
  type        = list(string)
  default     = ["ubuntu/images/*-22.04-*"]
}

variable "filter_root_device_type" {
  description = "(Optional) list(string) of types of the root device volume (ebs | instance-store )."
  type        = list(string)
  default     = ["ebs"]
}

variable "filter_virtualization_type" {
  description = "(Optional) list(string) of virtualization types for filtering (paravirtual | hvm )."
  type        = list(string)
  default     = ["hvm"]
}

variable "filter_architecture" {
  description = "(Optional) list(string) of architecture types for filtering (i386 | x86_64 | arm64 )."
  type        = list(string)
  default     = ["x86_64"]
}

variable "filter_state" {
  description = "(Optional) list(string) of states of the image (available | pending | failed )."
  type        = list(string)
  default     = ["available"]
}

variable "filter_map" {
  description = "(Optional) List of maps of key-value pairs for filter like [{key = \"hypervisor\", value = [\"xen\"]}]"
  type        = list(object({
                  key = string
                  value = list(string)
                }))
  default     = []
}
