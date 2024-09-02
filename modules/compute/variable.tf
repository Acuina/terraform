variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "web_subnet_id" {
  type = string
}

variable "db_subnet_id" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}
