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
  project     = "parking-app-v2"
  region      = "us-central1"
}


resource "google_app_engine_application" "app" {
  project     = "parking-app-v2"
  location_id = "us-central"
}

resource "google_storage_bucket" "flask_application_needed_files_v1432423" {
  name     = "flask-app-files-v2"
  location = "US"
}

resource "google_storage_bucket_object" "python_file" {
    name = "main.py"
    bucket = google_storage_bucket.flask_application_needed_files_v1432423.name
    source = "main.py"
}

resource "google_app_engine_standard_app_version" "myapp_v1" {
  version_id = "v1"
  service    = "myapp"
  runtime    = "nodejs20"

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/${google_storage_bucket_object.object.name}"
    }
  }

  env_variables = {
    port = "8080"
  }

  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances = 1
    max_idle_instances = 3
    min_pending_latency = "1s"
    max_pending_latency = "5s"
    standard_scheduler_settings {
      target_cpu_utilization = 0.5
      target_throughput_utilization = 0.75
      min_instances = 2
      max_instances = 10
    }
  }

  delete_service_on_destroy = true
  service_account = google_service_account.custom_service_account.email
}

