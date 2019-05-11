variable project {
  description = "Project ID"
}

variable region {
  description = "Region"

  # Значениепоумолчанию  
  default = "*"
}

variable public_key_path {
  # Описаниепеременной  
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable private_key_path {
  # Описаниепеременной  
  description = "Path to the private key used for provisioners"
}
