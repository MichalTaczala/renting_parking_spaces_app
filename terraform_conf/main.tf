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
  project     = "parking-app-420717"
  region      = "us-central1"
}

import {
  id = "projects/parking-app-420717/locations/us-central/applications/parking-app-420717"
  to = google_app_engine_application.app
}

resource "google_storage_bucket" "flask_app_files" {
  name     = "flask-app-files-5"
  location = "US"
}

resource "google_storage_bucket_object" "python_file" {
    name = "main.py"
    bucket = google_storage_bucket.flask_app_files.name
    source = "main.py"
}

