terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.25.2"
    }
    namecheap = {
      source  = "namecheap/namecheap"
      version = ">= 2.0.2"
    }
  }
}