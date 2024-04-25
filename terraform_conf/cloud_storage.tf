resource "google_storage_bucket" "backend_bucket" {
  name     = "backend_code"
  location = "US"
}

resource "google_storage_bucket_object" "python_files" {
  name   = "zip_flask_files.zip"
  bucket = google_storage_bucket.backend_bucket.name
  source = "${path.module}/../backend_flask/flask_files.zip"
}

resource "google_storage_bucket_object" "go_stripe_files" {
  name   = "zip_go_files.zip"
  bucket = google_storage_bucket.backend_bucket.name
  source = "${path.module}/../stripe_api/go_stripe_files.zip"
}
