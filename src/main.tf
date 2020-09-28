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

  disable_dependent_services = true
}

# Creating Google App Engine Application
resource "google_app_engine_application" "app" {
  depends_on = [google_project_service.enable_services]
  location_id = var.app_engine_location
}