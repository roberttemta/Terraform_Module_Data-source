
variable "key_name" {
  description = "Key paire name to Create"
  type        = string
  default     = "Dev_Key"
}

variable "key_pair_filename" {
  description = "The filename that the Key paire"
  type        = string
  default     = "Dev_Key.pem"
}

variable "region" {}     # This is a variable without any description