terraform {
  required_version = ">= 1.0.0"

  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 2.5.0"
    }
  }
}
