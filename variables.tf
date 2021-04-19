# variables
variable "name_prefix" {
  type        = string
  description = "Optional. The name prefix to use for the vNet. Defaults to 'vn'"
  default     = "vn"
}

variable "location" {
  type        = string
  description = "The Azure region where the vNet will be created"
}

variable "location_short" {
  type        = string
  description = "An abbreviation to use for the location. Must be less than 4 characters."
  validation {
    condition     = can(regex("^[a-zA-Z0-9]{1,4}$", var.location_short))
    error_message = "Sorry, but the short location abbreviation should be without spaces and less than 4 characters."
  }
}

variable "environment" {
  type        = string
  description = "The staging environment where the new vNet will be deployed. For example 'Dev'"
  validation {
    condition     = can(regex("^[a-zA-Z0-9]{1,5}$", var.environment))
    error_message = "The environment name should be without spaces and less than 5 characters."
  }
}

variable "project_code" {
  type        = string
  description = "The code assigned to the project"
  validation {
    condition     = can(regex("^[a-zA-Z0-9]{1,5}$", var.project_code))
    error_message = "The project code should be without spaces and less than 8 characters."
  }
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the new vNet will be created."
  default     = "type"
}

variable "vnet_cidr" {
  type        = list(string)
  description = "description"
}

variable "vnet_dns_servers" {
  type        = list(string)
  description = "Optional. Custom DNS Servers to assign to the new vNet."
  default     = null 
}

variable "tags" {
  description = "tags to apply to the new resources"
  type        = map(string)
  default     = null
}