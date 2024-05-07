resource "google_storage_bucket" "backend_bucket" {
  name     = "backend_code"
  location = "US"
}

resource "google_storage_bucket_object" "python_files" {
  name   = "zip_flask_files.zip"
  bucket = google_storage_bucket.backend_bucket.name
  source = "${path.module}/../backend_flask/flask_files.zip"
}

resource "google_storage_bucket_object" "stripe_files" {
  name   = "stripe_files.zip"
  bucket = google_storage_bucket.backend_bucket.name
  source = "${path.module}/../stripe_api/stripe_files.zip"
}
