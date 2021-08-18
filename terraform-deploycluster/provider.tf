terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = file("terraform-account.json")
  project     = "meta-yen-317503"
  region      = "us-central1"
}
