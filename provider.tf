terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.85.0"
    }
  }
}

provider "oci" {
  tenancy_ocid = var.tenancy-ocid
  user_ocid    = var.user-ocid
  private_key  = var.private-key-content
  # private_key_path = var.private-key-path
  fingerprint = var.fingerprint
  region      = var.region
}

