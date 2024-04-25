resource "google_app_engine_application" "app" {
  project     = var.projectId
  location_id = "us-central"
}

resource "google_app_engine_standard_app_version" "flask_service" {
  version_id = "v1"
  service    = "default"
  runtime    = "python39"

  entrypoint {
    shell = "gunicorn -b :$PORT main:app"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.backend_bucket.name}/zip_flask_files.zip"
    }
  }

  env_variables = {
    port = "8080"
  }

  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances      = 0
    max_idle_instances      = 2
    min_pending_latency     = "0.5s"
    max_pending_latency     = "2s"
  }

  delete_service_on_destroy = false
}

resource "google_app_engine_standard_app_version" "go_service" {
  version_id = "v1"
  service    = "go-service"
  runtime    = "go121"

  entrypoint {
    shell = "go run main.go"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.backend_bucket.name}/zip_go_files.zip"
    }
  }
  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances      = 0
    max_idle_instances      = 2
    min_pending_latency     = "0.5s"
    max_pending_latency     = "2s"
  }

  delete_service_on_destroy = true
}