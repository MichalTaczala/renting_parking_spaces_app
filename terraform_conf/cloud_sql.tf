resource "google_sql_database_instance" "default" {
  name             = "my-sql-instance"
  project          = var.projectId
  database_version = "POSTGRES_15"
  region           = "us-central1"
  

  deletion_protection = false
  settings {
    tier = "db-f1-micro"

  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_sql_database" "app_db" {
    
  name     = "my_app_db"
  instance = google_sql_database_instance.default.name

  lifecycle {
    prevent_destroy = false
  }

}
