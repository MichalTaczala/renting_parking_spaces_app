terraform {
  required_version = ">= 0.12"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  backend "gcs" {
    bucket = "remote-terraform-files"
    prefix = "terraform/state"
    # impersonate_service_account = "terraform-super-admin@${var.projectId}.iam.gserviceaccount.com"
  }
}
