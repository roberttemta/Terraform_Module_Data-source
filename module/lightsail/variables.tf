
variable "instance_name" {
    description = "lightsail Name"
    default = ""
  
}

variable "bundle_id" {
  description = "lightsail blueprint"
    default = ""
}

variable "blueprint_id" {
  description = "lightsail"
    default = ""
}

variable "availability_zone" {
  description = "lightsail"
    default = ""
}

variable "env" {
  description = "lightsail"
    default = "Dev"
}

variable "team" {
  description = "lightsail"
    default = "SRE"
}

variable "key_pair_name" {
  description = "lightsail key paire name"
    default = ""
}

variable "Created_by" {
  description = "Person who created the lightsail server"
    default = "Robert TEMAT"
}