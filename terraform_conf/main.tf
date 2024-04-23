terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  required_version = ">= 0.12"
}

provider "google" {
  credentials = file("key_app.json")
  project     = var.projectId
  region      = "us-central1"
}


resource "google_app_engine_application" "app" {
  project     = var.projectId
  location_id = "us-central"
}

resource "google_storage_bucket" "flask_application_needed_files_v1432423" {
  name     = "flask-app-files-v2"
  location = "US"
}


resource "google_storage_bucket_object" "python_file" {
  name   = "zip_flask_files.zip"
  bucket = google_storage_bucket.flask_application_needed_files_v1432423.name
  source = "${path.module}/../backend_flask/run_files.zip"
}

resource "google_app_engine_standard_app_version" "flaskapp_v1" {
  version_id = "v1"
  service    = "default"
  runtime    = "python39"

  entrypoint {
    shell = "gunicorn -b :$PORT main:app"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.flask_application_needed_files_v1432423.name}/zip_flask_files.zip"
    }
  }

  env_variables = {
    port = "8080"
  }

  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances = 1
    max_idle_instances = 2
    min_pending_latency = "0.5s"
    max_pending_latency = "2s"
  }
  delete_service_on_destroy = true
}
