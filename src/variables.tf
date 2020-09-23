variable "project" {
  description = "GCP Project ID"
  type = string
}

variable "bucket" {
  description = "Name of bucket used for storing terraform state"
  type = string
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
  description = "Credentials to be used for creating infrastructure"
  type = string
}

variable "service_list" {
    type = list
    default = [
      "cloudresourcemanager.googleapis.com",  # Creates, reads, and updates metadata for Google Cloud Platform resource containers
      "serviceusage.googleapis.com",  # Enables services that service consumers want to use on Google Cloud Platform
      "logging.googleapis.com",  # Writes log entries and manages your Cloud Logging configuration
      "admin.googleapis.com",  #  Lets administrators of project to view and manage resources like user, groups etc.
      "appengine.googleapis.com",  # Provisions and manages developers' App Engine applications
      "storage-api.googleapis.com",  # Lets you store and retrieve potentially-large, immutable data objects
      "containerregistry.googleapis.com",  # Provides secure, private Docker image storage on Google Cloud Platform
  ]
}
