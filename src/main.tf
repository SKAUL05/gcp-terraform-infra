terraform {
  backend "gcs" {}
}

provider "google" {
  credentials = var.credentials
  project = var.project
  region  = var.region
}

# Enabling GCP Services
resource "google_project_service" "enable_services" {
  project = var.project
  count   = length(var.service_list)
  service = var.service_list[count.index]

  disable_dependent_services = true # If true, services that are enabled and which depend on this service should also be disabled when this service is destroyed
  disable_on_destroy = false # If false, will not disable the service when the terraform resource is destroyed
}

# Creating Google App Engine Application
resource "google_app_engine_application" "app" {
  depends_on = [google_project_service.enable_services]
  location_id = var.app_engine_location
}