variable "project" {
  description = "GCP Project ID"
  type = string
}

variable "bucket" {
  description = "Name of bucket used for storing terraform state"
}

variable "region" {
  default = "us-central1"
}

variable "app_engine_location" {
  default = "us-central"
}

variable "zone" {
  default = "us-central1-f"
}

variable "credentials" {
  description = "Credentials to be used to create Infrastructure"
  type = string
}

variable "service_list" {
    type = list
    default = [
	"cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "logging.googleapis.com",
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "storage-api.googleapis.com",
	"containerregistry.googleapis.com",
  ]
}