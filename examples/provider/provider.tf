
terraform {
  required_providers {
    ngg = {
      source  = "nvidia/ngg"
      version = ">= 1.0.6"
    }
  }
}

provider "ngg" {
  # provider configuration here
  #token = "xyz1.asdfj.asd3fas..."
  url     = "https://<url>"
  retries = 2
  debug   = true
}

