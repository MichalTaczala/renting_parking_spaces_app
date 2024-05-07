resource "google_cloudfunctions_function" "function" {
  name        = "webhook_payment"
  description = "payment handling function"
  runtime     = "python39"

  available_memory_mb          = 128
  source_archive_bucket        = google_storage_bucket.backend_bucket.name
  source_archive_object        = google_storage_bucket_object.stripe_files.name
  trigger_http                 = true
  https_trigger_security_level = "SECURE_ALWAYS"
  timeout                      = 60
  entry_point                  = "webhook"
  environment_variables = {
    STRIPE_API_KEY = var.stripe_api_key
  }

}

resource "google_cloudfunctions_function_iam_member" "public_invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"
}
