variable "project" {
  description="Your GCP project ID"
  type = string
}

variable "region" {
  description="Your project region"
  default = "asia-east1"
  type = string
}

variable "zone" {
  description="Your project zone"
  default = "asia-east1-a"
  type = string
}

variable "bucket" {
  description = "The name of your bucket."
  type = string
}

variable "network" {
  description = "Network for your instance/cluster"
  default     = "default"
  type        = string
  
}

variable "image" {
  description = "Image for VM"
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
  type = string
}

variable "storage_class" {
  description = "Storage class type for your bucket"
  default     = "STANDARD"
  type        = string
}

variable "stg_bq_dataset" {
  description = "Storage class type for your bucket. Check official docs for more info."
  default     = "streamify_stg"
  type        = string
}

variable "prod_bq_dataset" {
  description = "Storage class type for your bucket. Check official docs for more info."
  default     = "streamify_prod"
  type        = string
}