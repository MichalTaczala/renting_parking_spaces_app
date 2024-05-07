resource "google_cloudfunctions_function" "function" {
  name        = "function-test"
  description = "My function"
  runtime     = "python39"

  available_memory_mb          = 128
  source_archive_bucket        = google_storage_bucket.backend_code.name
  source_archive_object        = google_storage_bucket_object.function_source.name
  trigger_http                 = true
  https_trigger_security_level = "SECURE_ALWAYS"
  timeout                      = 60
  entry_point                  = "payment"

}
