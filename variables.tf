# variables
variable "vnet_name" {
  type        = string
  description = "The name to assignb to the new vNet."
}

variable "location" {
  type        = string
  description = "The Azure region where the vNet will be created"
}


variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the new vNet will be created."
}

variable "vnet_cidr" {
  type        = list(string)
  description = "description"
}

variable "dns_servers" {
  type        = list(string)
  description = "Optional. Custom DNS Servers to assign to the new vNet."
  default     = null
}

variable "tags" {
  description = "tags to apply to the new resources"
  type        = map(string)
  default     = null
}