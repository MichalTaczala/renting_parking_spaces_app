resource "google_cloudfunctions_function" "function" {
  name        = "payment_handling"
  description = "payment handling function"
  runtime     = "python39"

  available_memory_mb          = 128
  source_archive_bucket        = google_storage_bucket.backend_bucket.name
  source_archive_object        = google_storage_bucket_object.stripe_files.name
  trigger_http                 = true
  https_trigger_security_level = "SECURE_ALWAYS"
  timeout                      = 60
  entry_point                  = "payment"

}
