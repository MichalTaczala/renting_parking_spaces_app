resource "google_storage_bucket" "flask_application_needed_files_v1432423" {
  name     = "flask-app-files-v2"
  location = "US"
}

resource "google_storage_bucket_object" "python_file" {
  name   = "zip_flask_files.zip"
  bucket = google_storage_bucket.flask_application_needed_files_v1432423.name
  source = "${path.module}/../backend_flask/run_files.zip"
}
